Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C083760A2600
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 10:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gfQy0RqA;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OMBgYIPt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KZXd83td
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ykAqLoi1r7lMGwbeK2sUFMARw3wZakPbFC2fhUJSl/o=; b=gfQy0RqAnGPQcu86w126G0y76J
	+8mTSp7zznpdhO1AYWKmjOqrGmr81FA+KE00Rbz94YJpkkdfi39SbHlOoZGVTz7AmgGmBeG4ylSYb
	bRngaF7XnrAAQ9MwhFVNcG3ZVUg+jaXj7SrU2jaHLvUmV5VOAH0/tXn58e03ayO4tKGGTgrHoqptp
	IwE2JEwwxo4vEQr6D6iCwQaokL5WgT9fHMLZzy4+hgLZBWGKn3aR+r0z9glHrgrE03NJYhwChDmFr
	CDANiRC35NdpnsumbFUmbQKX2AhoYDWTSQrKR+pmUz0xdZEjXjVNuS2YVj5L+MAmBId1wdGkPHELe
	ixLzNAWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLetp-00000004N07-2ylt;
	Tue, 27 Oct 2026 10:59:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLetn-00000004Mzj-14vf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 10:59:24 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeCH13026391
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 10:59:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ykAqLoi1r7lMGwbeK2sUFMAR
	w3wZakPbFC2fhUJSl/o=; b=OMBgYIPt9T08DlmnRfVl6Gi+DMt6ReICnWuXECkd
	MBE7LkZ0raB+jlsfl8WtH+h+vzcGxO9v8OVBBodYX/wiPt2R/aOn9n5LNav3++IP
	W6Wa85taDipM9pgkzo1cjPrwGnvXJ2Lr4Vih5YOtu1ZnkUW9bSnnVd7DXalmFbi3
	Zp1YXpZuTlCKjZWlbePxsCCTglCpukctIPvppBeFpqjmPc1AWHq64ek9UMzqqDQ3
	BKBLgFL8YEHTHg6ZOu+SUYIGTXEr71oojboRRdLYw98rH00DSTAPiukDrjx5xc/s
	ZTJ0QOxQ5/rZfPoLR+/zcD2GrBrvaFVCZSIrSEE96WdwyQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh91a3sr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 10:59:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53395d51187so69440521cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 03:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098760; x=1793703560; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ykAqLoi1r7lMGwbeK2sUFMARw3wZakPbFC2fhUJSl/o=;
        b=KZXd83tdcuU3ytm6UlxnNBskRHOS2cFG/uQ/gMedtBG4esxWhGl212wCxBKDHgRA6K
         TYsC/SEVGReljIw4qtHefu9wueoYMNxx9E3eoUsOMHCGW/ALv5nkzqDKwnCPmWn6Bizs
         ai0nqjijIlKZ9EY/uTjgMzGuQL9jq2+bfLwQFmk+kN+ha+IqD8uVR25654q7pdufYpP9
         t+wQbziiaJgZkNQVMYUb8RjloQcyUi2q/51PS9iJvNyXZiCgLWKThsWKYOKX2ruyTa2H
         EFS7Che7TE97uCtPMltiiRx6WMd1f6Ckpud1+Rk3VkDjrpmxClIWz774sMmbWfFlMPBt
         XUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098760; x=1793703560;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykAqLoi1r7lMGwbeK2sUFMARw3wZakPbFC2fhUJSl/o=;
        b=0XClG7If/3FuktTPDEd3SKBES+2G4VrVo5Ke1wsYsRWxCsLSgt87f809BwPVM4MFsw
         yD8juvxEc0EjjPFU71wOrZbj1GHcRqrg8ogOypvLGPkWafsidXF0D21WM0GBfnIWBF06
         vyDx3gY89guAHwkX41T+fCwZ7AA/5MVjX8wrP8ixPAMSI8DiPg627ch+DQUe6SfNMJ+4
         xuAvWt/R3kXs/g2D33pG25BV+wAMEQxY6wADNngybmsQm8+DiQZ8er9w9JdsajNLU1hs
         EbMFzZKudXYQoLo91fj/tNDPBJu7hu11n6KvNoMQwe95r5uj5z3O7Er8ENjba/mpiQJB
         akHg==
X-Forwarded-Encrypted: i=1; AKwUvBwyWwEq1gfoDuUmr1FvCKOcyTepDu+ycB5ZoogeG1dVnzqZgK4Ry+ntnhVSYlNIRZtK8xdlv8glKh7eBhsRq0OX@lists.infradead.org
X-Gm-Message-State: AFq9FYJJL93XmiU+uWP91eTP5gKNe7ZgnBfC2pZcU1mhOk3PsuRcRhsx
	iKwgh+N5vOBeZAgZJMpfkD8+BUP2zx1DgM6KX339OlwuHdFOgRR+roB/tgEkIuKmkf1x2X1VZB4
	KbZbjjkT337+Gopc+0Vln0DFtYkXr71+Ep0aYh5dcyWhtTEzKjtSVMYBnIMUOoIglE39BOklLgW
	xlbA==
X-Gm-Gg: AYBFou1v+9gWkLl9wgu4r1Bcc0umizn88WgBuYbaHLJC+4NqPMFOyrqdREcuC7F4Jam
	Y5Pi5LqS/NAPsZFtc3FbmR3d7ctRVIyKwj2GGMD7J6uKiAEanMO0YN7Q6N1psGTjdTLijcRgZA7
	Wn49YsJ5uX5MeKIfKmXZj6DWjMClFjecmvmgYr32FMP44N94zMjOgkQ4EYx2HZc0ln1rB+n6ur1
	J6Iv0pkGhYNsRaxaL4cgNmLdRCbDFwWMkMp2VunrLaxLYZhigmdQDJ0qHABFZbtA0qur5qhIRav
	NL+/biyB/0sFANzgxJn9iOmKboxAd5PrSzL/oOWyzmmnhnUw+YTtj7RnBb3Ik6xrZp6Sa7g55oO
	yZg31Tqx7SjNaPKKw
X-Received: by 2002:ac8:5750:0:b0:535:33a0:520c with SMTP id d75a77b69052e-5383b350840mr170740291cf.3.1793098760194;
        Tue, 27 Oct 2026 03:59:20 -0700 (PDT)
X-Received: by 2002:ac8:5750:0:b0:535:33a0:520c with SMTP id d75a77b69052e-5383b350840mr170740191cf.3.1793098759624;
        Tue, 27 Oct 2026 03:59:19 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a5ea0df763sm178309875e9.3.2026.10.27.03.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:59:18 -0700 (PDT)
Date: Tue, 27 Oct 2026 12:59:17 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 6/9] arm64: dts: qcom: sm6375: Do not mark MPM as a
 power domain provider
Message-ID: <junlahp3txwwj2bs6pi3lhlvidxcp3zgvszb74xbciv4n4ymvo@tfyhqi6tr7mz>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-6-ac7f1a0d5638@oss.qualcomm.com>
 <5ad62m2ix47ynkq2ikghkxdqpcyv2tjixtojdobpjpdwbkkab6@gjklpaosvpk7>
 <114418ab-dab6-4772-994e-5babeed72b65@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <114418ab-dab6-4772-994e-5babeed72b65@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: H39pgkVtcNJft_f4rF53RPW0OSeR7IF3
X-Proofpoint-GUID: H39pgkVtcNJft_f4rF53RPW0OSeR7IF3
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae08409 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bcB-52WucOyEF5bHse4A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfXyp5nYg/PzGxS
 w8rYcF4mZ579CWZWJk4SlVN258YUPCGIJpnIxtpOzEWJcpujm5XDOjg0BWA7WBDr898LNHA4b81
 d0/GaGj85IZtMCq81W94T2bGM/5ZdsWwnuGF66cNVm3KZFWhGVeOBogG8SuZB0ay6C33oFr87QH
 6LmrzWWzxHqY8hEnZ3Q/PPeIaqe/m23dhUrCcPEmmQt4mS3ecX+EGwBo96jOYORtPeyq02zdx/c
 mPZwIMHuK7maolpg68n1E3ua0drSJ27mLwPSULTCaWsp8hCF2VGVYnknFSZYf3GG2rB8Mi2ZHvx
 zE3PoWcyot/+9s90Ygbu7lbS2/FZfksKgcoTFiVeZAGWyT9aN9zUOUjd6yQON64hluvYEGntCrS
 TRno98YnlJJaBmRRKlZR5T9PmbZpxA/Mm1RoAPlR5E5Io/G+AITsfmXvImpbDGmZC/YbUzM5z7o
 Ib/arOpRrqLBhhR1nNA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX3ehPROhBIMtZ
 QZVS//mwYw0XUEI5W/tk26zEzaq6lPIhOF5tyFL6QepCOgoy9ZXVgk6je8ToCKpQxZq8ROFZUxw
 nfiHTkODplMLUBjLIaGq9f9qAe1mMNc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_035923_307603_9D83734C 
X-CRM114-Status: GOOD (  17.64  )
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26-10-27 11:23:25, Sneh Mankad wrote:
> On 20-10-2026 18:30, Abel Vesa wrote:
> > On 26-10-15 15:25:22, Sneh Mankad wrote:
> >> To make the MPM design more logical and avoid probe dependencies, the RPM
> >> notification is managed by registering for CPU_PM notifications.
> >>
> >> Remove #power-domain-cells property from MPM device.
> > 
> > Can you elaborate a bit on how the two phrases above are related?
> 
> The MPM driver now supports two ways to handle sending the RPM notification,
> either in the genPD's power_off callback as power domain provider, or within
> the CPU_PM notification framework. Removing #power-domain-cells instructs MPM
> driver to follow the latter path, which as explained in cover letter would
> help avoid probe dependencies.

This should go into commit message, I think.

Thanks,
Abel

