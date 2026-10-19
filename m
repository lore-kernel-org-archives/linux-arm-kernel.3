Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03608606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 20:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZAGH8Enm;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a48FjdXZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=En9OgwER
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxpI/j7tSygFqEOcpnrDp2XkhyVuL60i0HFuGyDuJN0=; b=ZAGH8EnmtGigxhkhjp4upm30RA
	Y4LvaIN6bOB0dPJQZc09V5K6NXHSsQe4f6HD7KfeGjZKk7aycd0uIbZu7icybDp0hsT4sCSn+LY9G
	pMAcqzvKJlrtdB5LnXO5B6RUImey/dtsMJ69KGi6/roFykFit34atF/A534tDRFqI9bHt+ch/aaaV
	yAKT1f1+1dMzN4nrq80oSXM6SHBjSfoiIn1IYo4dsY0l0POdds7men4K3HdDunZ+1b+qRfKGuSa9P
	2lts1HIxyLONF10s2umTkO4mwJkKEmtBz1z5K8jTMWci8smi6ASiZUxBFXXUYpuLpKKrrPrOa36UY
	AgbNXjZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIu4W-00000008Jdl-1RXa;
	Mon, 19 Oct 2026 20:35:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIu4T-00000008Jcy-0pOV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 20:35:02 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JJK3k4501259
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 20:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fxpI/j7tSygFqEOcpnrDp2XkhyVuL60i0HFuGyDuJN0=; b=a48FjdXZqNLtjTFD
	iyc/k0OfwXT3cpSVDLRUGRko5vq6AuZVieFgGNU2Yv7ocQQ9ARRhlC16fynBejck
	NAkck9VFRxTb8BtGNbgKiy6lfCF/OIg3W4i3UbSbOislRk2FK4XaVAJvrrE1BS1l
	MCEc8dDHCfv4BDykfD/qinKWyFygbfoO1SEpZde9j4nCRECqW1qLjOvsFDFa7bwm
	n01RV4pK02kAnbEcnD84ZQA16lVDqu9rNl1/2R5UqWYoZOiEheVeFZDjXx1PTEE/
	1hnhrh1a+TjCOd6+zVwpHnzA2EB0RUwUx4Dx1Qe7HbRCKPPkace9fz9NkVrKls1b
	rfFPyg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3fb64j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 20:34:59 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so5424678eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 13:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792442099; x=1793046899; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fxpI/j7tSygFqEOcpnrDp2XkhyVuL60i0HFuGyDuJN0=;
        b=En9OgwERdk2g3zIY91J64VVNUg96TDqt8M2qwRCAfGk2mv+lwHSp7JxHVyHxxhjyEV
         0x46yQyCKe6ypXMOttfVKcT2YsBCOn2rwWd9pN5oCw0lAD0x8CzAh2SK3MRgc/vFbS6G
         vUwp12xdiRloHKnhORg+xSs4nb0BCUCNArx44OHheTpCnw91qnpiPTTnLDzNF8tdoKVx
         EmxTfssZ+bdurYXhQLkI/g5CcFph3q5GeMFGQr1mH9fJVXN2bdPpUIeu3IOqN1xFPSby
         0aHpnbFr0HOYf55/nBVts//u9nZTyoLUBb1GEb7Req6ZYsD0UqQ2K3yLoCF6z0DCtuK6
         ruTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792442099; x=1793046899;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fxpI/j7tSygFqEOcpnrDp2XkhyVuL60i0HFuGyDuJN0=;
        b=FoFh+G1v8mQkk0EKiTqEjGXxNif894yVoxlFCCprwpO528Zpjg/blSz8smPdMW8UR3
         LlQDI+qFrksIZ5n4uxepanx0WdmLskhJXtDkAAS54iObdQyy0dxrLRrEM7a+ljU7mRMg
         +AorBuH0lCUFnTrj5CI65za6BFxR263YydLywPy3vlU+ZvH9tkrPqsPUtUyIDcbSmG5K
         7XPHA0kUedcg8oKloBdcRaX2JzgbQdhSPZG236Ssh0zqIFYA/LDL9IbmVk5qtJU1VoaU
         oduSGhirOF3Og6NV7kxE4AmArLKEwSK8cLrLU6sOewaIy3N9PBGEoiCVhvXLST3lAXsE
         98pw==
X-Forwarded-Encrypted: i=1; AKwUvByJwoXXUN8jDS2o1Gglju+qsuQtpBDxRTNurazFZ9TaTAAqT876YMHMa4x12JJTQyH6Vs64S8pkQWg1c3Is4ojD@lists.infradead.org
X-Gm-Message-State: AFq9FYJULzYg2MbnN0OWmCfHBWFNlBUmGzscbsWhtbyLAQ3TDG6sPaM9
	sRJ3+YzHBgCUOjGaIVEsy4vxNXYg7VkwPVT5Fdm8K9j0C1txvacwm7V/QVR3o3gYsCdcYg3ElBY
	53h7sL14OnDie97dhcLYIik0r/krGq9H9v/aHMUAcrEW1AR3F4fj+zLwTfXCiaA8A/u2RW1Ihct
	xChg==
X-Gm-Gg: AYBFou39Hln/OIKFnXtoOG2cuIQgq66z7SsfV/FlSizOZOzlvNVRRey1YjOv6Mfgxia
	3OQoyZeRE8/fOEVB1ibtG96LZ6p3SSu1Dma0J4ri9MBRj1qEkpAFqM5nalcQ0mRGoYrsEHwfUOy
	SECzQbKE3prIs/hCXLVEOZ5CnqetIhF4HfuYHF1NVG3Sv4uRKazjsKcAFS5ejhvo4+EO8EgP/ZV
	ZUzIVozwIgIkfi9zuPzE1fkaCwEcLxWVUqkzjfAtAOB3MgMiqJx8bbynMQ3yD2OHaibrwjFnDLj
	h82T/GLX4eYB36dw5fpIqhjn6KnRHDHRKA7/Fh9RzOazh4K+2gkESbfrVMSwVEetTgGC3IKu6+M
	T+Bw3Enxm6y1tFlp1fvJ8u+pRmKJpbXBOh2LdlyfpS8E=
X-Received: by 2002:a05:7301:6447:b0:359:2729:1797 with SMTP id 5a478bee46e88-361a224d1a7mr15667644eec.30.1792442098726;
        Mon, 19 Oct 2026 13:34:58 -0700 (PDT)
X-Received: by 2002:a05:7301:6447:b0:359:2729:1797 with SMTP id 5a478bee46e88-361a224d1a7mr15667603eec.30.1792442098201;
        Mon, 19 Oct 2026 13:34:58 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a79c7sm34045005eec.18.2026.10.19.13.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:34:57 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:34:36 -0700
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
Subject: Re: [PATCH v14 01/32] firmware: arm_scmi: Add new SCMIv4.0 error
 codes definitions
Message-ID: <20261019133436.000035ae@oss.qualcomm.com>
In-Reply-To: <20261016185553.2794459-2-cristian.marussi@arm.com>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
	<20261016185553.2794459-2-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7Jx9XUbz_wlVFwVrk50sJtEIihr9BoHs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4MiBTYWx0ZWRfX0QDg4HEBYlGd
 tnhYV1ZraMMSJBLy8OqLvwgI3j0HH+tn5MOetST9p1THAdZWk9ztpjISTMYJxGf52+Qv0m6U4aL
 2Y7qP8KToyP67JRP2+7t/o/OxBYbUsxe806aNpDxndqKlLhSmSHgB3KXptmrE8DyarceZ40E1dq
 NOkwELbplQ9+WXEydDroAXeZX4YeqZ+UvRvl0w3mR2SPyTSUfgL/zApet9xo2JDgOzqiQ1mKJEK
 TMpUrKdwnDDZgzcRtT9UfXsLn/TjRSuuF9AQfA20NbE7QCEy5VRwjltj0LjWr+Hu3VEA/RhGZrr
 tFM5PI+0Vg/0Z78JHcypFcNjwoMYN/zLXXXEmqkOB0rKkyqmTMzhNGR9ZJXQw3iA71JuAhXrJt4
 GmhKbYcq2Z+JivIAKi61srkvMG8tPjH8h9gsp89phanxDLAsJSfbTOGnAuvfAOcx1cIVjEcWsHS
 OS+rMy2iuErz9qfWt0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4MiBTYWx0ZWRfX+uD4mwwt01b6
 mEb3sBRmMJI/ZvfF7f2wQf6lMP158NVfiFk+XiWoPG6EtRi+fkJcAK3Mmr+Zzc0eFJIAUaRQfOc
 6W/jpoxfN3cJhI326UwGF6CjNJDbwg8=
X-Proofpoint-GUID: 7Jx9XUbz_wlVFwVrk50sJtEIihr9BoHs
X-Authority-Analysis: v=2.4 cv=OaANnRTY c=1 sm=1 tr=0 ts=6ad67ef3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=g_d9z9Baj32627wmS2EA:9
 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_133501_247667_77E2C2C8 
X-CRM114-Status: GOOD (  16.71  )
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
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 16 Oct 2026 19:55:22 +0100
Cristian Marussi <cristian.marussi@arm.com> wrote:

> SCMIv4.0 introduces a couple of new possible protocol error codes: add the
> needed definitions and mappings to Linux error values.
> 
> Note that SCMI_PARTIAL_ERROR has to be handled specially, so it needs to be
> distinguishable.
> 
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

> ---
> v12 --> v13
>  - use EBADMSG to map SCMI_PARTIAL_ERROR
That's a stretch given definition but I looked back at: 

https://lore.kernel.org/all/arK7kLlrg491EsMf@pluto/
and appreciate the problem of running out of error codes..

Guess it is the best we can do,
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

If you do a v15, maybe capture some reasoning in the change
log or the patch description itself.

Jonathan

