Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6079F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 01:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YgsF6fXR;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hZDWih+e;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jIZBG6zX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RJPAJwTyk99Ed4rKr5mXpNq6/k97CEUnT+YCoSZgg30=; b=YgsF6fXRXKupl8
	jg1xauJxjxpWCgDAryFYGmm+nksaSVCFUeNV9DaMvd4kATlkt8QNrbp48+QCxEP4VJpSakI34rFy3
	HewM1dl8yov8DJ+j6qsXxRMLJfpTwNTMwddN3bcpFLMbpuzWovFN9V9YKYrxJZFFxLRA/sdpeEQ9p
	5qsGG+T8S4zC1hn2B2CAkvPy/3belslyL+bZ69OdxQXI0FZPtbeHCFVk/tkBgaRHMCGinFWEqdrir
	VUsK5mIlGekoCw9rwr2Je0+R+zsJCJDs4oSVzNz0YUG5Ly6Pb+okwFdtzRTS2BCgnwiVIs9dw3WTm
	b1EH6K4xKeB25Nv5MyBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLsBo-000000060k0-02mK;
	Wed, 28 Oct 2026 01:10:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLsBk-000000060jg-1oJG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 01:10:50 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S0j2To3766271
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 01:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RJPAJwTyk99Ed4rKr5mXpNq6/k97CEUnT+YCoSZgg30=; b=hZDWih+en3WP1X/t
	eMjn++8sX3oLIoaOoa2bJDDkhbzruXNPzWmN4FrhHjZkAXSiQqORHY5b1gu+/0G0
	ZbTkooi2Nmgj82v+9u9yMWmxmWjXwjkrOqPa0EZj+KWTKJs63Fxtn7dHFqJ4SgGx
	jXu4vpU4BHcYVc6eoy9/wOqQZJCiRhHMdFI6Jb4uhLyoejB8LjTdR0P5sXo3zCDK
	CNE7JgdJJv+nFzxQJfesBNmWw3TPqyxQJ0PZU75zbrH00m2MACfdmRGtedSN9xQj
	5cbDgz0+A3yHQSs4Ktamf4BLb7OdU+MNJwZ94CAEkqFzNZqdUwuWfzm1wnxjAOzp
	pj6KTQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq6bp9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 01:10:46 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c3c370b17so658551eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 18:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793149846; x=1793754646; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RJPAJwTyk99Ed4rKr5mXpNq6/k97CEUnT+YCoSZgg30=;
        b=jIZBG6zXp3o+s6IL1u/dnojp7uo0Gx02amj7YKk977iV9j2GT7tVpwPz+V2ByroZcF
         FBnRDjHA3Tv+V+rLKOXx0XzuXm0jto+L+mVls3tFvnyqRq2625oF0AYnwWWS8v98lpMR
         XXg8EYJXxyHde7EqabxSapxUkmdbnQmCE3p8SCZEkc36CoTA6B02+PRA7qonnuXtt6uv
         4BVUotd+ptiq8cziSC+y9J3ZMrvOr3AWP2PbIdduwA9RjtBqI00ka7aCsIcF28BuG+Ps
         B89mYRyB+eqyihjlkqNpddaEqD6Smth7IlZfnwPRVD4+uGJjsjqfE8sCFTq+SnFIaamg
         9x8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793149846; x=1793754646;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJPAJwTyk99Ed4rKr5mXpNq6/k97CEUnT+YCoSZgg30=;
        b=Nfg35+25TnT03jlc9gz1JrFjDj8Xqh7EdWYgVCfMe+0aC5iWEGFa/WdXS+RgziJIIp
         0qnM6zNY26OU/19Gdlsnw4ShgOTIqEdPHc8rcknYBtsj8c8tYI/cMzB9qj+KxwIRpcND
         0KBbV0rrLmLrYhuxDCVW8QhRHbJyrm9Fvek8xkf6iZMpVw7ZK/1O2nF+joiIlzxOLNp0
         fn+dReC/Z74Ch2jymBHsVRIduh4ueDGCGy64v4BcpIWmAyjOqYRHcJMdqtrEpuAK4iUE
         gkdngkkD0FWpAH/7TQr++WlL+ue7CxcimrdjaTC9nhe7QxdXW8/6QRUbWalKJusyDHD+
         vMDw==
X-Forwarded-Encrypted: i=1; AKwUvByyNBUq5gO50eIU865kqPMrraNAsL2SsgUj1/10J2bVD/iSjz8EFV69sxxTwSj1j3GEkRJ91IG+gEGQ8MEq8L1x@lists.infradead.org
X-Gm-Message-State: AFq9FYJN5EMwHpVifhGQCOf8lCTiNC0kiI67ag/hO6hS+WCL2AjuEG8q
	8EE1sxbtelHyPOyehm515tSJyJHI0nl3QC4eJ6k4iouq3TZEhPri7eR/TVWqFvEZ49VFK6AyXXI
	YyECFDjw8AGTQi5hhk5wVNs86MxzvNWI9ZyuKjYA1sNqmMcrNOx8qln+ccd+WKtqPMhF2R3mPu0
	uzEw==
X-Gm-Gg: AYBFou1g0/5hA5b5y3EBbKvDXTxqaMCBFbK5SsZwQj0Pq7JsYBSX4PPqq7J+7rVTkle
	IUSzNQikFTO/Dcm+vyGsMtAa8B7oEfEnXSPD2wKCN9UDtKGEOX05if/gBmXn9NuOWEjnHqMHLeo
	KN3JkFxxDY8Tro/Tf0YRfx5SgP3TG2UdLlO6BHFpBsZxsVHDWhzbx8hey6XJepl03r51T3ckySe
	mwHAJNKaHJk2ildZr00NtXDZwVldOHbH3IJavmpxj1pqiVFCTQRi66rRpUDvC0laIfHfAr7ewv5
	sqIu0iXcF3aiOm29XX/jH5pn22kphmSxWsc8Q4ryFGjAf3L15sCAzs5/WLKzs5PeST/4MJS/Bpc
	J8SGMhQvxoXsg9qgpwpJ22+nwRu7p96fzlg7uDZmhmEa301f2wk731WUEVSeS09Q/NKhL3HKOzS
	IbPOMqRdMO73lS
X-Received: by 2002:a05:7022:110c:b0:18a:3911:ec1 with SMTP id a92af1059eb24-1a6ce2ff7f6mr1084993c88.39.1793149845515;
        Tue, 27 Oct 2026 18:10:45 -0700 (PDT)
X-Received: by 2002:a05:7022:110c:b0:18a:3911:ec1 with SMTP id a92af1059eb24-1a6ce2ff7f6mr1084949c88.39.1793149844674;
        Tue, 27 Oct 2026 18:10:44 -0700 (PDT)
Received: from [192.168.1.199] ([68.248.129.193])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75f51bdebsm675047c88.17.2026.10.27.18.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 18:10:44 -0700 (PDT)
Message-ID: <32fc0379-0c45-4011-a7ce-795c44594b89@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:10:43 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4] net: stmmac: dwxgmac2: enable L2 split header
 support
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        lorenzo.bianconi@oss.qualcomm.com, hongmei.xu@oss.qualcomm.com,
        abhishek.chauhan@oss.qualcomm.com, sarosh.hasan@oss.qualcomm.com
References: <20261015221215.1714047-1-sagar.cheluvegowda@oss.qualcomm.com>
 <179244898962.3135.12890405028818098249@kernel.org>
Content-Language: en-US
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
In-Reply-To: <179244898962.3135.12890405028818098249@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae14b96 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=djYDpCgIitZxdph7ACYjJA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=WVQ7OhcWbFtDb6XmBhIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: EUik8W7Ly1rPMr8Ex3S6_8psWIgl1zAb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAwNCBTYWx0ZWRfX+c7xYShoLUWh
 1JQYhW5TQRT+xwOfC6n7pNwSmpl1ztPevYqcGKIzJBTT75wDOsof7hUgMZ7jmrk1MrsVq3xZzKH
 fOYu9+LeIFzjr/9TjJ4R8ik9OorHkwY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAwNCBTYWx0ZWRfX7H2d+CMXz3rt
 s31Q1FZndyfHqacJxWdiKVNxsoy8F51nXwMBNZwJMsXsGncTlRjhOeEum4k/xszT2FuWtZNXQ/W
 FQFj0qdACkr4AWuT3KSgTzTojA1mv5wsJiGnElUiKIvnmNuLhyX6aCPOg765zjbzAHcFFguzBQy
 VDjxWKVX/8eGQ8GZEQL/FGXXOg7YuVjXlxvEXkijtIisJgU/FQVAhbscCVqkI5sVl7XnO+axm32
 Xxt/9sM/idM4Y+3u+8amOjQWpPmagDUtO3BWjJgzz03R+Tc0106RIXpvv6D4M6uRbeQfH5bTPwU
 vfiGa9UKNOOh9kAeOLDRtIsVV5JGpq9eHgOspwP6OgqMRyLcxdEI7TFu1n9a16ZCVvBFO/u340B
 ecLps02guJPvP9dm55lLZqHZiBxPi3qKKLnnzr2EgMrNsg0awZ8KgW2gIaogwVEvDinzHW+hDof
 pzxr8eW/XLYJreUPaZg==
X-Proofpoint-ORIG-GUID: EUik8W7Ly1rPMr8Ex3S6_8psWIgl1zAb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_181048_836308_3F9E7FC6 
X-CRM114-Status: GOOD (  19.01  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/19/2026 3:29 PM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
>
> Critical: 0 · High: 1 · Medium: 1 (1) · Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>
> - [High] On XLGMAC cores, dwxgmac2_enable_sph() now corrupts the RX queue
>   enable register.

Agreed. DWXLGMAC_CORE_2_00 shares dwxgmac210_dma_ops, and on XLGMAC
offset 0x140 is XLGMAC_RXQ_ENABLE_CTRL0, so clearing BIT(8) would
disable RX queue 4. In v5 I will move the EXT_CFG0/EXT_CFG1 L2 split
programming into a MAC-level callback implemented only for XGMAC, so
XLGMAC is no longer touched.

> - [Medium] dwxgmac2_enable_sph() programs MAC-global split and preamble
>   settings regardless of `en`.

Agreed. In v5 the MAC-global configuration will be done once rather
than per RX channel. SPLM/SAVE_EN will be set and the variable preamble
disabled only when split header is enabled, and reverted when it is
disabled (e.g. when RXCSUM is turned off via ethtool). The commit
message will be updated to match.

> - [Low] The patch includes a fix for an existing XGMAC split-header bug
>   inside a feature patch, with no Fixes: tag.

Agreed. I will send the FD/LD handling in dwxgmac2_get_rx_header_len()
as a separate patch to net with:

Fixes: 96147375d49f ("net: stmmac: xgmac: Only get SPH header len if available")

and rebase the L2 split header support on top of it for net-next.

> - [Low] dwxgmac2_enable_sph() sets the 2-bit SPLM field
>   (XGMAC_CONFIG1_SPLM_MASK = GENMASK(9,8)) with `value |=…

Will clear XGMAC_CONFIG1_SPLM_MASK before setting the mode in v5.

> Pre-existing issues:
> - [Medium] This problem wasn't introduced by this patch, but the stmmac
>   RX path has no dma_rmb() between seeing RDES3.OWN cleared and reading…

This is not introduced by this patch, and the new FD/LD logic does not
depend on it. It affects the common stmmac RX path rather than just
XGMAC, so I will look into it separately from this series.

I will also fix the checkpatch line length warning reported by the
netdev CI in v5.

pw-bot: cr

Regards,
Sagar


