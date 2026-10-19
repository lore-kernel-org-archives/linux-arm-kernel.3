Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABF5606A319
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 21:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M5TcoaKv;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZXOYYKIj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LOi3bXAg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L47P3Zpg3RMSsu5NECVxz4OxMZT8bD2P1rs9Ujh18GE=; b=M5TcoaKvlqr7tKcAjqCOnO0/kn
	gyXIuAu1aL62Pj684eTHbjOA4sB6Xv6KpxEhgoeBV7vpwyk9zibI+QYhRvlJANiaWvcyNv8Co3H1G
	j0emAPuGf7zMiAv0Q3/2saBr3XG7MuePT/ZruPQB8unEtaXwWAGWJwGKy/87aWskVG0UTP5bnGMNi
	d8HvGCZn1GoDCWvJ6CMPBAKRyxE6igqu4ZuyGZOqfkNtK7fkzW4VlO70uVjZisnPuz9zp7urq+j8V
	BASPxFWeMsh/FDJDYbuNNiVJ2es0NOfFwmm5h68xilx6b/z0q0KMLgbGVnzi8aGcp3gDrdmsbKWPT
	PFVq7Msw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIutG-00000008NWW-2ESy;
	Mon, 19 Oct 2026 21:27:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIutB-00000008NVc-3Fv3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 21:27:29 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JJK6nG501330
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 21:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L47P3Zpg3RMSsu5NECVxz4OxMZT8bD2P1rs9Ujh18GE=; b=ZXOYYKIj2T/Npqpv
	PnkgJ7GEH1Tqih+lwDXBB4G2XecFMot/BMs7ml6A+WSxz3cQ6iaQnqVOr2mfZe3I
	1CQoPkhjBC9V7ugFQfEJBQz+jU3VMqUE3+Zqozukg3EHlMXASVBvPV98XRw/vz4M
	8tSSx6bOSW2/cRjDAZlOaOY9B4sIP8h99EGCo0IzCWEZxbmwXGQ9YTtDY946AYkr
	y73qdWbw54Q5ehuaCPxISXwGCwIzczaoTRMzyIFEI0aw8p87spYDxn4pCex4nNcD
	UULwrygIBy3iuQ1h3IMMS/v8Y0fKetMJH6d88FTI/zZI+ak8JvtKTp2iOSKE1Ca1
	pL3W3Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3fbb92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 21:27:25 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-351788121cfso7737781eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 14:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792445244; x=1793050044; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=L47P3Zpg3RMSsu5NECVxz4OxMZT8bD2P1rs9Ujh18GE=;
        b=LOi3bXAgzUjERSJKhBrv2WIM2ldfU+3NjxJCThqtfxjwTz8mCKZPngLBrrw98fQev5
         m8nRZuz1KYBR6tkSsUcUW/q9ReHWAgQ7gfJ5akZ5odsdfzG+QTgTW96kRlcbNU+tXpLT
         C+yTTUILDcxyIb9RozopzMr+/DT9+6Jt5jHSBfPR8xNYvIWJbClv5VlFBzYqUh+PfCiv
         SD4AdwUOEUSpHrkNlc4gnG60vv/bRf8d9cSz51u4wAgcgNiix7miOrguFQ7GFKUyaAAv
         rrdDm26a/D1cInW91JY4hJIM8n9+inejleeFHT5ofWaBw65u41PQ7NLzVv17ip9njO+E
         UKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445244; x=1793050044;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L47P3Zpg3RMSsu5NECVxz4OxMZT8bD2P1rs9Ujh18GE=;
        b=ghvUiIY+lwE7/AEi0Yzw5tMXXngVa/fdFOkQs/0e+ryoto79xDPgHDVnZPTDPeCywz
         yfsfr1BSEN8lApl5S46WxvR17CdNizzwBqVUpuleGC1E8GdWIBHIxm0kMCzIfneVSjYM
         j2PO6tqbuKkBwvtaoHCeE/gsiM00aWf9VPZymbFGRxG0VX7EDGA/KRg9FkZTLDJQSOAu
         lncT1oEHsiPmnoX3L9J7eOmzPEQvMZWrj5ZdFtUZ9oa7D4uIfvWGx8Xs9k28D3bsWgFk
         +7B/ywaGx4Sy4vir9IAM0A5W1S0GiwcTpacLiRRRWr9hL5vUeUzOz1UjOaAjcK8tLZFE
         qn7g==
X-Forwarded-Encrypted: i=1; AKwUvByt9vT8JXWrAMzvYzCf04yMClUCo0oh0SZkq2aIlhqqvy0IbRAkmRC5lDnWYlKG8Zk97CLmBQrWKe1SOtTBW4GR@lists.infradead.org
X-Gm-Message-State: AFq9FYJJHDh5iFND9fDLXgcS/b+2jIGZ1lyDVDIixPGFRcLWx/lxQlwK
	LbX/ITjq1WlRfm5CbYFcJSSMuWk2ZC4U4En7aei/kHi3Q+eSm68YDAnXigzyWvaRYOgiOXOeZ7/
	8Yxk3vp9CNlr//XbrAYoaweJr66RNyuR88knb2mX3jmgRaa1LUeX3EBNHAVJ39jsngBVjZ6IhCK
	TEngzioDq0Tw==
X-Gm-Gg: AYBFou2Aw3h+HYJe8PhiLOwgNZlHSblXAqbCXmiqCIAH2r+NdKmpGmvQ3ZdYpPEUQcc
	jAt+t8qdqEsgTvaUHExrr6+IvEXWk/1kZwPem8Ic9hFKRwDNbWYbJwHY/PH140Uai/8rX9JWR4s
	MnuImQyy5zG/oZEdS0TKPpIFfkmv+K96mMXsAFpD0GgJrTWiItLPWEA9JQpmb8CTxNWv3AsfFXa
	tFwJ4l4U1+Zbs/EbrNdZYi7/lzl4LB0a/xgAwZbzfoOkGInQrA4/PucSZoJVXHcUg40HYlRarwk
	VOSOdFBwB8Cd5w8rQCs3m3t4UP9OmUkimhhWHheS3Z0ZKP4vnrhDyjaXUlrCL06rgHNj1VJE3w2
	Catk/Daods7wm00gGX1YswY1F0y9HEpa6Vyhi2xk3Fw==
X-Received: by 2002:a05:7300:768c:b0:35e:a117:8fd8 with SMTP id 5a478bee46e88-361a18603d7mr18625598eec.17.1792445244495;
        Mon, 19 Oct 2026 14:27:24 -0700 (PDT)
X-Received: by 2002:a05:7300:768c:b0:35e:a117:8fd8 with SMTP id 5a478bee46e88-361a18603d7mr18625532eec.17.1792445243837;
        Mon, 19 Oct 2026 14:27:23 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819bc569sm33491810eec.11.2026.10.19.14.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:27:23 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:27:19 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v14 07/32] firmware: arm_scmi: Add Telemetry basic
 attributes enumeration
Message-ID: <20261019142719.00003b78@oss.qualcomm.com>
In-Reply-To: <20261016185553.2794459-8-cristian.marussi@arm.com>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
	<20261016185553.2794459-8-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0jmbmcYGHvjj40ycOJKVfTH4FCj_mopo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4NSBTYWx0ZWRfX6rycrRKa6UsX
 oLIl/2ohju0gsoBJkfO1AjoidyUa2vItpZ5yWn2YixjnNY1AZVMxkf4fo4qBryRfN2Fe+14UKTH
 hrvsKbL//OycvoauEUB2j1PEUGY/x1u4gCsi91rovAvmMphjdC9rsfyWcwY78JY139CCc2fU7/H
 N/YSCXPN3eOq7R5i7U1q+I0WRfM/BgWAfEMTfaRngmA3C2mEsTApE6/f+wvDXVMeSFAUuYouLiV
 aSlQHhE8zLBQl7wD8mvlWSXAzmhazUSRWTDFabWs1UWGfymSylQSWV2D7TsSfaE2B/deLKUnpjs
 L6rQVUAB8Ul65Kqe+GAMdRgrs9ILFpHenD4X8+bv03YDs7U62TL88a8iVllDeKUO589f3R11G5L
 /jsaKysjwkMBHdcfvFCjQdEIw5GY5nMscazuLJ3SIqgxD1ujCGu/VA3BqxibxqzGhPAiDZd+K1k
 4plkgQY53BhLTNwqUjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4NSBTYWx0ZWRfX6J05E/mLn+Jt
 D19xGWzkMybR/o//AuwD/FHmdLG9tARDJBHqjQH2AgerGyIkijCfb0rktuF+B1NF4vvFJMhgHwx
 0D9ZAX74PfIH+2CnOb7rGGDNpDQ9bd8=
X-Proofpoint-GUID: 0jmbmcYGHvjj40ycOJKVfTH4FCj_mopo
X-Authority-Analysis: v=2.4 cv=OaANnRTY c=1 sm=1 tr=0 ts=6ad68b3d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=T7b44NXcgtRVRp_EcVYA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_142725_848139_03B75180 
X-CRM114-Status: GOOD (  27.06  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 16 Oct 2026 19:55:28 +0100
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add SCMIv4.0 Telemetry basic support for minimal initialization and
> protocol attributes enumeration: expose telemetry instance descriptor
> via a simple information retrieval protocol operation.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

A few minor comments but nothing I care strongly about.
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

>  #endif /* _SCMI_PROTOCOLS_H */
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> new file mode 100644
> index 000000000000..32f6f8d1106d
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/telemetry.c
> @@ -0,0 +1,148 @@

> +
> +enum scmi_telemetry_protocol_cmd {

Perhaps add a comment on enum scmi_common_cmd containing additional values
that apply to telemetry.

> +	TELEMETRY_LIST_SHMTI = 0x3,

> +
> +struct telemetry_info {
> +	bool streaming_mode;

I'd bring fields of internal tracking structures in only when
they are used (even if that is just setting them).

> +	unsigned int num_shmti;
> +	unsigned int num_des_tstamp;
> +	unsigned int default_blk_ts_rate;
> +	const struct scmi_protocol_handle *ph;
> +	struct scmi_telemetry_info info;
> +};
> +
> +static int
> +scmi_telemetry_protocol_attributes_get(struct telemetry_info *ti)
> +{
> +	struct scmi_msg_resp_telemetry_protocol_attributes *resp;
> +	const struct scmi_protocol_handle *ph = ti->ph;
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES, 0,
> +				      sizeof(*resp), &t);
> +	if (ret)
> +		return ret;
> +
> +	resp = t->rx.buf;
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {
> +		__le32 attr = resp->attributes_1;
> +		__be32 de_impl_version[SCMI_TLM_DE_IMPL_NUM_DWORDS];
> +

> +		for (int i = 0; i < SCMI_TLM_DE_IMPL_NUM_DWORDS; i++)
> +			de_impl_version[i] =
> +				cpu_to_be32(le32_to_cpu(resp->de_implem_rev_dword[i]));

That dance is a swap as data is stored le but UUID fields are be.
Maybe going via cpu endian is fine as would be silly to have le32_to_be32()
so it perhaps has documentation value.  Fair enough - I argued myself around
with agreeing with how you did it here, but left the discussion for anyone
else who has similar thoughts.

> +		import_uuid(&ti->info.base.primary_revision, (const __u8 *)&de_impl_version);
> +		ti->info.single_read_support = SUPPORTS_SINGLE_READ(attr);
> +		ti->info.continuous_update_support = SUPPORTS_CONTINUOS_UPDATE(attr);
> +		ti->info.per_group_config_support = SUPPORTS_PER_GROUP_CONFIG(attr);
> +		ti->info.reset_support = SUPPORTS_RESET(attr);
> +		ti->info.fc_support = SUPPORTS_FC(attr);
> +		ti->num_shmti = le32_get_bits(attr, GENMASK(15, 0));
> +		ti->default_blk_ts_rate = le32_to_cpu(resp->default_blk_ts_rate);
> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}

> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index 5ab73b1ab9aa..121c83e1c6d8 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h

...


> +/**
> + * struct scmi_telemetry_proto_ops - represents the various operations provided
> + *	by SCMI Telemetry Protocol
> + *
> + * @info_get: get the general Telemetry information.
> + */
> +struct scmi_telemetry_proto_ops {
info> +	const struct scmi_telemetry_info __must_check *(*info_get)
> +		(const struct scmi_protocol_handle *ph);

Why __must_check?  Be a bit crazy if no one did anything with the
info they just requested, so that seems overkill and doesn't help with
the long line.

> +};
> +


