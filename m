Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673F560A260D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 10:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KsIgze85;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zm32Ublw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fonioozh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ha3fj/COMHQz5CNWaubKxJEoCG8ElfvHahMKU0w0GYA=; b=KsIgze85V0028Sgi42HGi1J3r6
	i9YQgwDcqCspIeNsEKnlizahJhRcNuP+VvLrF2DMId66kQHFuRdCnoJquRdgA3ysJqYGZ+vaSEYmg
	AqF/Bje/ilGPJGLMv1NOYAIEJfUrPNYVsFpFGEamTYclhk7NZw5hBweEKHLhHCEqOGMG6A/KrmNRI
	MmZVcCMmyHoTZwhV9/VjNBQ0jhIWad5kOGtWswYhuG2Indivqn5jxDYXeR/CKbAXWmSWs35Bf6Lv0
	p+9Hok1KuRzygaGcAsPzlLwgKWLg6FPMJ5OPPsD/4eZx7rPYLVLHDfxMs1mZUu9WSFQWFGNFLvsx4
	z7QeEHDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNI7-00000008yGz-15fU;
	Thu, 29 Oct 2026 10:23:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNI5-00000008yGJ-17ov
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 10:23:26 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vCOJ2273314
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 10:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ha3fj/COMHQz5CNWaubKxJEo
	CG8ElfvHahMKU0w0GYA=; b=Zm32UblwrpFNdJzdB69DOZIKQdTau7hMM+lmAp8N
	cJqczZeK3MXWDjsMs/sjcArdqDErxtMVpFRxP+RvIb8k/EwuKejzg1JVOM66N0nj
	cbnGQqPEh6cTy3RutZq3HJdxyd+Z6MyB0+C5FirG89nUuSym1y8msLtvUFlKnr27
	kaVSncyxq4GMcY6K+Qyw4PXer81E7AMnLo5sMM2e4XYzGAbKm1TlYqCJbUr0v6MJ
	pIK48p5sEVR+Q67V2+qmy2uEC0m+JQwe9lHbm7E5AnReEJugdazjtXaUgkLyYtpE
	9E1oZWtf/KqWF6O30IIaDZyh4q0snx72PcIhxhE4IUbvzw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm31b0bt3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 10:23:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f62934ef6so193239085a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 03:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793269403; x=1793874203; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ha3fj/COMHQz5CNWaubKxJEoCG8ElfvHahMKU0w0GYA=;
        b=FonioozhuEtpatltLqYB3GbhTetkmqV8F5kGWNiplqOg3SCOOkR6uYiXnQ17KXpfOK
         rivtqyPH6Sq50O8fylENYHk8wlU0GlK9bt1WI5t5LpuOrS2EyjRecIR3Ur7kQSqhi3NO
         E6xVQpPHyHtJpVF7v2DHY/QFtw07fi926KdRDUP3vJp8Uzh8GOdPGfZSEHKqaFN48qux
         1yFKF9rALff21LFsHJNb3xkx9jlzGniNPo7J/MNsm2+OQzKZjzIp4doMQXFgN0uGQkcV
         GV3c7mSm6F7v+ZiT1aVhmaIWtHApiKKmlLJ8XUuhZtWgyzKRc3l/D1OU4s+olPZuTcpS
         5eTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269403; x=1793874203;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ha3fj/COMHQz5CNWaubKxJEoCG8ElfvHahMKU0w0GYA=;
        b=gRZMOZYt+XRXXwn9TwWFdMj8so7MS88rk4vcWlk/6DEEQl2OVMWKFGbj8x8Ze1NjXI
         kBVLSwU4sTjmWK/wDp/BqDaOUaaX+qBhMFZd7ca6De2msomuzreci7owoamgcYZFLBjD
         wUxhd9PedaDKMxXWyUntsGyVFUzFiiIV0SrFKWVc8uMG6EEulmmKjK85KIjzVuCuCmaL
         HqJq9lwZg7n2P1VhGxauG246FXvz5fjlBeCDnP72Krsy969GXM01C3y16VUs5F9jacvX
         sfA6cf+KfUX8dEsDAFymir9qKwVzg6f6iIUgLEEUHehbTJgNc33H0APq/ITfuQWGwKFT
         qn9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzYOkvHJBn3ZRNhbryMp7GLsyVmtLfA7mwD1vk3TS9opiGyaxU01F2CsLueqwbDvINubPrZFh98+QYWxYRyNror@lists.infradead.org
X-Gm-Message-State: AFq9FYIwvj4ZuIUl5b4eVUmF8mkF7zFf/KxTSczczdBdX3ESn7PiFigV
	WEo29x0vrlOWaXph8cB/pqtzztwKTfhNit1P0CuhoGy47Ln/QOumKComjFQr2D0doA306gpdQXr
	hs1ZyGm47c4QDrZ7GjAuLjC7B8ThApJ7YtZ+1ePOEqxwhrsusg3TfQ0xccmGaZeiJibNWTEjtss
	DN0g==
X-Gm-Gg: AYBFou1kf4cf6tce1D4lbeYgttrPlADbBQe1iZowV/wZ2pT4WUbwXgUojQAoCaOVxTf
	f9bgAejLnsVCYuUaUaFLyMbCyokyE7XHX6Qw2vqHjyXxcvwNMX12CpyTh8x9Wnm0r+yAKnrzQqY
	jcC5GoSLf+JoTwuPo9VMXzT2v86AqLP8W08WnFzF3XCV3SPAmn5kzYwSlGSWo16KweTphhPROGI
	/rmDiZDnPzecRpavNY/iWGEgaHZ8CEfFNRZR/nJ+OibZ7tQelt5ot5mMu97kydZtG/Zog+aNbVf
	357zp8VMgjVI6cQSy7bGxMgLSx3atHSKVINoGuFt80K4ca8imL9RDgHpJ5yh+dTxr6UcoeiXkaO
	de6dln8RmVsfm9KLZCK4AYJRBH7rBEyc/n9c2c9urBniGBPGxR0Cex2TmE6RPRc5Y
X-Received: by 2002:a05:620a:2616:b0:93f:23ef:d6ad with SMTP id af79cd13be357-94408899f84mr736630285a.0.1793269402901;
        Thu, 29 Oct 2026 03:23:22 -0700 (PDT)
X-Received: by 2002:a05:620a:2616:b0:93f:23ef:d6ad with SMTP id af79cd13be357-94408899f84mr736624485a.0.1793269402246;
        Thu, 29 Oct 2026 03:23:22 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfb8esm33494130f8f.54.2026.10.29.03.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:23:21 -0700 (PDT)
Date: Thu, 29 Oct 2026 12:23:18 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v27 07/10] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
Message-ID: <sh3b7m43aw5wtrolooxsib3rus6br4rao6wtnc267rczqysyis@75voym3v7emf>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
 <20261029-arm-psci-system_reset2-vendor-reboots-v27-7-fa4b3ff1359b@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-7-fa4b3ff1359b@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfXzfISHCvGq01w
 ybnJ7UjSzklJ0v9E2/w3K8hBKUto0D33+3OsDoTTQmPNEs5dQBlZI+3XXRSnOapuH6CymVye2gE
 qhJnI8cG4dlTC58tjuxraHNW8dR85dU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfX23HA9DiHFt1L
 09duCnT6bsSBh25VvNiUl1Vh+SR1wvN+mDNwla04upjSXp0rDt5pv5pdDPpGNOW7PmoFh4dB53Q
 UtJwMrxlq9/tb4GrIQERqLocPgSpOF9SAYeR+pUw5DCFOrCUQKxDvCzXz39c1QgXIunJJWJj6Ab
 GixPmewXfUbVBHJgNVJTkzZXASjrHM5iQTiGrhZjCPmch5/5EmKzv5UeIzEqy4fWpFlpZhClVyT
 6Exg1fj6iy/o0IGC/XX6tRlOKaOArvLuE1UO5+LvVA2YGe+mqQ/1yVJLzVCxBf1dAkLFoTRQRFs
 711N3ulmEttUztIFLRHb0MhF56Ha6uRSMsPmeuQUDtIecHkw2svC7l1fpfieNqXbXTuvz48xtef
 3KZE2uIE1WPVqXOgbZoA9x2vXp2OgRCGtNEmI1tQ721jKf5RwYwZEHgYAS1iT0jq8f21dlME+ob
 aia3kpO526Xwpa7NSBw==
X-Authority-Analysis: v=2.4 cv=A8T5rKWG c=1 sm=1 tr=0 ts=6ae31e9c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=XpayGGiaTZdiRO3YngYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: QRDY4cpHVWYQ7mLT8TFSoKbw2EJfT2Po
X-Proofpoint-ORIG-GUID: QRDY4cpHVWYQ7mLT8TFSoKbw2EJfT2Po
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_032325_316070_C5F2E90C 
X-CRM114-Status: GOOD (  15.14  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26-10-29 14:31:01, Shivendra Pratap wrote:
> Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
> for use by the psci-reboot-mode driver.
> The following modes are defined:
> - bootloader: reboot into fastboot mode for fastboot flashing.
> - edl: reboot into emergency download mode for image loading via
>   the Firehose protocol.
> 
> Support for these modes is firmware dependent and not available across
> all kodiak based boards.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

