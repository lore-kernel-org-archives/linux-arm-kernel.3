Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00E9606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 10:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MtIBxPbM;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kj1lw3qc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YXA3dlsI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVoFS5UdeUKhEoUyshqUvMPNFzcB9a4hiumD1nyvvGo=; b=MtIBxPbMC1kHUziAWIujm5k6lm
	DTPA7YswpOPtDxBlZ37pVpS3YyOUut9OtEGfbia6mv2WyGVDGMH8Z5EZx0GrwTfMtPgxWmajVAsSJ
	iyUfT5RvnDCmrzqBuP34T+Fr5ZDMc9mq9BZJSDcmDYe8ii4bjZaPuEWh7lMRgFtc4LVBBKyEnCdKa
	yB+TQLUs0U8ad+PjdPe4kT1YBnv0y+J+v9a7uzuUUl4WkvktFLNGBsCZJ2HwTBb0vq7QOEy70cZzO
	e3yiqVfdkStsVXx8Bvios6n1B4ZysFk/dnwoMADU/YlF69Fc/4rfyVPdKYtTHrrODMIoA7l0W8O06
	0gPlRT8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTfo-0000000BcHW-0jL8;
	Wed, 21 Oct 2026 10:35:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTfj-0000000BcGh-0ePN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 10:35:52 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA6DmG848835
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 10:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DVoFS5UdeUKhEoUyshqUvMPNFzcB9a4hiumD1nyvvGo=; b=kj1lw3qcgVzh9yrJ
	g5cjz2WfGS0Mir4lkZ9p+r87Yd43Dsu6W5akW4KQwJu6YU+nkuAXn4z4hvdU/Iab
	3yHn1kXxaNt9Z4r5W5DfEtXpCQBAS86GEn7OO28q31v2KJDEKU//GWOKQM1179UW
	gpgbQdpQeSTmCnYTUK7yg17g4qzFpGnn6Q/Hp/UgEYNkb6T2Du6woWrKxEnfOSLW
	G7zyfNRFgu+WXetuKpXZnSvNbdza3+JXwuJr2JAOi806Z32cKEwUujkUWryipSan
	ftEzhBEyeSVcosL8BFYE/1+dSV35IkYCnXrHIJ4+cw3RBWReni4knJVjOd0Le6VZ
	70wL3g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajkg5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 10:35:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac5877bso18078785a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 03:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792578949; x=1793183749; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DVoFS5UdeUKhEoUyshqUvMPNFzcB9a4hiumD1nyvvGo=;
        b=YXA3dlsIphziXpLzodaRPFANAg4dzjbSVtzveS7HOJtOe2q2iyfW3nm+cqrpbzFpCE
         Q8SLK9+yWOnR7zd6Ih/9Bame67FL1GihdoLQU3poYZH/ibGXiMhiAG/gpRPcm4mX9EE8
         WDzFEDwqNx8snMT+9K1ImwpGkJ5sktHz9DEyMIW9f+I8Avt1x82AWwEp+aCnAgfSVfns
         lpiFK8VRlqemejHf/jWM27tMVWGzuzZ53tAyt4Srp9DTTjdtdEdx8DL0eU6aEyq9ikUi
         mEeJT95sFuj+kfz3cELKtDLJL5CrGNI00f45DFTvd97CAONuRgBcsY0eGPO1O3lK40c9
         laTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578949; x=1793183749;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DVoFS5UdeUKhEoUyshqUvMPNFzcB9a4hiumD1nyvvGo=;
        b=DOIrph9SvEGmHyYtMbg9IJ910P7ObNTcq2+7HyiqfnUYugugk4tDytQ0fxy6GSa0kC
         +aWYv/Mpx0KTPRPqQrtlUcOzD+Wu2ltcYeSuvBsTZyBeAfdG1smKTDeoKWgNxYhrIOr1
         jc9WcTmHOD2HZ7/o0M40ccrH7flPMNWhBFifHk0H7SQsTtf/EbNMMkHNdH3dAVMGUYNx
         iOr/eDRjuI5S0Ag3Z4fOUs5Nxc2sGvEJcgPMRO9MyTPQvG4doaQLFIlYdxrcqs6exZpr
         nCnNRClg9/lXZs9OwpWFmXTndgSSUxyj3oc+RdQ9i4xdZSHeWwOFNcBQzwzohOoB5pBt
         Ulrg==
X-Gm-Message-State: AFq9FYJL6tYoNGaFnN8VLm+jnO1DfwA2yMlpHoECazSs+ndzEySPXS3y
	uwgi3nx2Qp+eqg+A/+jTKCyBHVVctKC3WKOsohRl7/eap+To1MKtKT/tm5HdDpg+vhvRx9Vw8NP
	aZzscZxhhL2oqnWkY4MmCqQCyesjO9e4Jh6hywIcNtBQI4t+xOvam2RoqHEuzMo2t+GdXDFYFa9
	uYwA==
X-Gm-Gg: AYBFou1qEL8i6glTtkw4/egwp5v1Pg6DDtSNRBlS8JALmZmgby0O3T+Vj1spUFaCVvI
	a53mgNWNibLNQtAZCe3iNlcfMayPUUlJescrypNXpr2FNwsXVIdpdfZzYPbnhaLZ6d8u0WGmgtw
	8XqrtPgP5xRdppjhe4+mKiItNpijeJAFRXQamZg7VLA4J8qEccTTi7uN3g+lk0kja0WuIuNDQLH
	QN+k+pLrao+jGx9k+M6dWk2Vrm+Y+IUekkvzPP4kId6/OugfaHpAuwWbsW9c5K89Dew4zi0M/40
	liZ03FYmvSnXTby8/s7UsUzxkwEdjDdiSC0cpATCvJMVdbNdJuRPn82bq3YDw6bdpjuo9puy1Ry
	J8gI1kSsuyj4MeNYJwdhCSg==
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr439497085a.6.1792578948924;
        Wed, 21 Oct 2026 03:35:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr439491185a.6.1792578948428;
        Wed, 21 Oct 2026 03:35:48 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40315a59esm695162a12.32.2026.10.21.03.35.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:35:47 -0700 (PDT)
Message-ID: <193e4885-9d0d-4f33-b2b1-650021413bec@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:35:43 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: msm8917: Use a shallower cluster
 state to fix unresponsive idle
To: Reza Kurniawan <imkyufie@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Val Packett <val@packett.cool>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261018-psci-fix-v2-0-35f65b59eb9a@gmail.com>
 <20261018-psci-fix-v2-4-35f65b59eb9a@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261018-psci-fix-v2-4-35f65b59eb9a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX1gZhNUnQKT0M
 1alr//EmYWzI6cw2MdFoRBY70Sc1KFwh7Ly0b9PgdlSUEXeyZqpyoJNbThbDxWkgr6Hc91qNr5+
 meo+hKt0v/s9JxAQVQaiSK4n4vf6Ywp5ncQ3nkGqu3YPTlrhFq78AAQZurEcO9je4uKogZKUTS5
 sqbTu+OHz5NPgTGkU/THJ9xnLZku+71OoAJlgccD+5KB9JZ11FuELjtg/QqCTWq5HzWw8DH4kUn
 y3x26j48GkQArczMxYee3otfz90xsmojEaE6nvBOF3P5XRvcZ87VNu/Qze/DyLYu8560dk5FXWd
 5gNLa2bL6lFj6CPZO2/HkGC6EO/e9I8pYHirexWgyQIT3+4/rRhe9Au4I0Lz3SRDj4zWnghWcpK
 K2wpKVmPNCXRrNZPiKs/cJCAXE07aECJEQaZy3c+un3BSfQts6QAjaGbGhUTTHHd/C4jDzRkMlh
 S3Ricb2Yhj4spDto5TA==
X-Proofpoint-GUID: 0VsZOlj5TZDJTFAwxPauIIAkgcITXc6T
X-Proofpoint-ORIG-GUID: 0VsZOlj5TZDJTFAwxPauIIAkgcITXc6T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX8ktN3di8jzcL
 lvxgeJIe+AFKQEYW7/aPEsUUItGnoK+z13045Jc9uTn4RL22R4KNaLJKEhXzd+Z1PytB8yOgg7T
 t2C1yWuTyMi4e/xsinzlU1rnVvc0Xdo=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad89585 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=VTptWAqQFsUFMNnqaZMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_033551_318953_46CEC298 
X-CRM114-Status: GOOD (  18.74  )
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
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/18/26 6:29 AM, Reza Kurniawan wrote:
> MSM8917 is a single cluster SoC, so powering down the cluster means
> powering down the whole system. This causes two problems:
> 
> 1. The system becomes unresponsive, even to common interrupts. Waking it
>    requires an interrupt from the MPM (MSM Power Manager) or scheduling
>    the MPM to wake the system later. Linux currently has no way of doing
>    the latter, so the cluster may never resume operation.
> 
> 2. Entering power collapse blanks the screen. When the state is entered
>    and exited repeatedly, this shows up as visible flicker.
> 
> Even if MPM scheduling were implemented, the second problem would remain
> and it wouldn't fix the system being unresponsive at idle.
> 
> Replace the idle state with PSCI mode 4 (dubbed GDHS downstream), which
> is less aggressive and can wake up from conventional interrupt sources.
> 
> Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> ---

For the sake of git bisect working, please order this patch before
patch 3.

Or alternatively, we can get rid of this one if the MPM rework
series lands first.

Konrad

