Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD8B606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 06:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m9APP79j;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RGRCJdyq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L9gXwx+t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sG9Xj1OZVI1nTkH7YcZt+Jc0eaj5QNvufoqH8/wgxTY=; b=m9APP79j3LtKM3zxAnxCFHmFyd
	qJvlPIh3Dd+B+a0A3OQjlofhGWUBpc8PEy5vP8+x++CQxk3+Ad8yy0LM0ItoG62LjxOO/G3s+Kg5S
	+Gj7AFYZYJoHRfC57LgjXPKM6agws7ZNyGhHSJh8kf7SR38cWfxlI6a8Vhxt7Gr783tTt2MVg/3WN
	0FcBLB1PQjGy5F28C0BjkpUC2XG2aXH/7KndZ99xk+lmLFvzDe0QkiCvX+P1N2vkmdKncATP1Hn6S
	+i+cMXcwoia3SGxh48jA4m7dMP1Yf5keAxFyR8BE8fAvvSj9brwSjCUW9tgrnRoVR7z/65gEOGeex
	fevvteWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLx2o-00000006PI7-2N4z;
	Wed, 28 Oct 2026 06:21:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLx2k-00000006PHB-3GoH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 06:21:52 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4PW5D1134031
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 06:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sG9Xj1OZVI1nTkH7YcZt+Jc0
	eaj5QNvufoqH8/wgxTY=; b=RGRCJdyqidppeH5y1UWkTK7cqkfH7Ky9Hx/ccd47
	Lnnk/+X89OuXV4QsYlpHNhta9YMeZRyqHzxhYfDOe4sdVNVIKHogj/BD0IBKu49D
	gYK+9K6xQegHz7NBVAQB6Ne4nMd87z/smpPRZ6sr5MASz0pSJY1OUwh03urjLeWX
	LFJOmSc9x31D47tRusH6y392NtJ76nj9OJ0TDd5HRvm0Zi6+fCWZqDOY5keXmQUV
	BoGfUbaS0lUsIGwKKljqKXPwjmQLjAc10Is5OLCjsy7Pe44cjzBwSDMbwLy42s2Q
	qI9/AgiV1vRoWorSAwP6neZNRLg+Jscrta8Rm7PZu+oQfw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjptnad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 06:21:49 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3552883bd19so499695eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 23:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793168509; x=1793773309; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sG9Xj1OZVI1nTkH7YcZt+Jc0eaj5QNvufoqH8/wgxTY=;
        b=L9gXwx+tFsSTB3uc2NrLT3sEKeNhdrLKPPKLoplwSXo8mbY3rmH9y5vwiejzGSNzOu
         uKaxIfF05keXqb3rssjiVhaN0RfYQGOVQFRs51Y9deOoIy1A5giuGpVQ1j2TN3lXCKpn
         WvGK87tn4qSbUwjUdUccpH+wl5oavVbAN1Z2iPTJbo4bFKkj1Z46ayrUiSi3PRAF559r
         kXZIhpqk1nR0lbsmoxrQClGnTZjfb2uyCPunkhGfaUp6jSJMBc4dQXPNZ4b5J5IJvACl
         RHOLUeSdtNuq//tA7mtCAim+F6RIe1BNCigG4eAkQ2lBPJPQYdHiUFgzmwBtF0rNfa6Q
         jCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793168509; x=1793773309;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sG9Xj1OZVI1nTkH7YcZt+Jc0eaj5QNvufoqH8/wgxTY=;
        b=ZNmbiNpUZD7pBIkRVHht19BiFm0uPLGGVz9QLxcn1NClPNFTky0ntN/qvhKAAHmtHn
         D+QrnxYah+zPll0LRbikuAmi7Vv9BqRsWJ5FbJCHmoZQJf2GiIq8lWUvpzB1Nm+RJomw
         iV3Sv2E3OGAXmHx6RFpU7HmxHDBXhz/PH9zQi3rgvrv7qgJvxMiwj8JczW86+BlTnpzq
         pq8qWvB1k0ZJ7uZZGvS44OijPnGKXr3FK8NShJ248nZEPEhFiw/bryguVRlyszhSa5CK
         COBQ/8BN2qhherhMvOGhtVgQjloFkIXjfqkOLJaQIrhlZHQx5AYbNceTimtLLgJrhgN+
         v7zg==
X-Forwarded-Encrypted: i=1; AKwUvBxAEQvyJ7Wk1wjJczejVZKDLQM1I4K765B6a1PVOjoPUm6JOghZI4sKg4I6SFTd9/hxg0K9RUixavUosi2NgLPa@lists.infradead.org
X-Gm-Message-State: AFq9FYJtwC46FzCcZ31wqQl5w/RsjzReNLLmHldv1jPti+kBxh3XZWad
	ARcjaOZ8F0fI8DeYeDvLHMEugOWAzuGNO3GmcajkhDPJ1VdaTD3qK8IOJwjBmnUbiUdP3Dfy4JW
	nHMWlnUxDPJAXD0Ffn2GVc+DYFWjEz/dGfGpUEBBEQOArweI8cwJ19m7OR/3J3hfsrFLWwsETMN
	YqyDRm0yE2FA==
X-Gm-Gg: AYBFou3GzvNCHbkuw5L/LeqHY3G5EftX5E5A4Y2rjySP73gSwP4vfLiFYBrynLwJ71S
	xegbcWGH7hAPla5cuQQR6ZlNi+at321Jkk+wQuAVapKEEwQ6ljX5eWMguwnzpzvkXelnrbJWwzf
	dNuY6iOWBujN/BakwnH8H+lml4H+E6eoD/c1J7LWdzcVPlxIn8riNyvBiGa0RMNORSxhDsNDDB/
	2WKo46VgnoJ0h+pobVoyISmWjtDGj1FB9xLrhdbTd5icZ7TLhYU4imfKPbd9yHBKMvwgmBlHcca
	JnnM5H4HNuNN/k04nNKGx4gvb7NiDk+9V88U9jEMAhV1Jx4nndopA6qCIbzRm/T+OkOuvaYAMGe
	/2tB8NROulcS67k63NHaIkM6pOy5nI0KP3dSpFjFSU+uafZznmOIkQX2lpCMbJnAluFeam2kKY3
	Fcm2O1MQ==
X-Received: by 2002:a05:7301:fc01:b0:369:fa8b:d725 with SMTP id 5a478bee46e88-36a204a51c8mr2161087eec.35.1793168508964;
        Tue, 27 Oct 2026 23:21:48 -0700 (PDT)
X-Received: by 2002:a05:7301:fc01:b0:369:fa8b:d725 with SMTP id 5a478bee46e88-36a204a51c8mr2161055eec.35.1793168508453;
        Tue, 27 Oct 2026 23:21:48 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23641e78sm3397103eec.0.2026.10.27.23.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 23:21:47 -0700 (PDT)
Date: Wed, 28 Oct 2026 11:51:40 +0530
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com
Subject: Re: [PATCH 5/6] arm64: defconfig: Enable PWM_CLK for backlight PWM
 support
Message-ID: <auGUdP/IZnAEui89@hu-anantiwa-hyd.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
 <20261021-lyra-display-upstream-post-v1-5-585caa39cd7c@oss.qualcomm.com>
 <fa143c9a-722a-402e-84fa-a127494b3f5c@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa143c9a-722a-402e-84fa-a127494b3f5c@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyNSBTYWx0ZWRfXwY27leKL/elW
 N0kR8xXnm97aGM0w2lHVTz2G7JyzGKJBu4fY1A6h4KlVIFRATlm6g0DOj14hIxdLHtgcBzZc6eP
 r9wAu0f8R04NUi7+8RtUkDPXE4xXR7bwqIYCkMKFvJgvf6OrPa9J9Caj21R0556owyw02BneasE
 zFXaCdBrUOiBd4F47kBdBZl2W9ljPh17o2j5m8myGY12yf+tnfE46jm/pCp/MtHjoDsOpkLEKoh
 qCiZYGGtPnoLlgrLATaC3V+qemdhOyXlku/piEdGcm4qXXM56XN0CiXOevTMu/U4eCAZclp6O3A
 KUu8DpUxB0rd2kzOtPLIyRoAsNmfCCvdVBIAtQkVWNbv/wNsJPOY7R+bUfrtB0gzUuq5ejoYsmT
 B+ybI/f5ZqQiAdxGcFVjD3PPcEmHydKbtlbe5M/1LbELQzmo2QCjj7OhPtBYQ4U6IdNBiRSwcKw
 1zMmZQ4WeLg9kDBzVWw==
X-Proofpoint-ORIG-GUID: kgjxTqAMwPezbu6tg0bioIAc0o26TPsK
X-Proofpoint-GUID: kgjxTqAMwPezbu6tg0bioIAc0o26TPsK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyNSBTYWx0ZWRfX/PwnG+UP0qiL
 rZhPwyZs8osYzav7U4Dlf3pcwCIF0k7VF0Tl6iG1ZZnD8Tf1sQ30lv1YCh4bkGWGYq3pWAU64cg
 edRkvab6vDiLjJZQxMWxFgYmMKHiOm0=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae1947d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=eYwbJGcMLBrUiUMk08gA:9 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_232151_226692_956651A8 
X-CRM114-Status: GOOD (  15.61  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 12:48:05PM +0200, Krzysztof Kozlowski wrote:
> On 21/10/2026 17:17, Anand Tiwari wrote:
> > Enable CONFIG_PWM_CLK so the generic clock-based PWM driver is
> > available, used by the Talos Lyra EVK LVDS panel overlay backlight.
> 
> We do not have Talos vendor, you sure you did not miss dependencies?
> 
> Best regards,
> Krzysztof

Qualcomm is the vendor. I'll update the commit message in the next 
revision.

