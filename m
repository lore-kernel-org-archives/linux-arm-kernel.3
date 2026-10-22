Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256E3606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 08:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k9WaQXAj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=dli3Kb3M;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VW6AFGvi;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LIO6HXli
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XifzIrjO8Um2mjh4fUxoQvxrf1F5cyhzZDGnoH8FPys=; b=k9WaQXAjEKQykU
	xOnEWrE9qPazWvBCu4qewCm3TXi7Hz8kv1sc7ev6NFUH/UupASZx+6qkahJN83/+V1R3LposEyUgP
	LlgJ6/jcNJL4sGoca3ShM2LvIDGHrKpcI7Q7W3Igytxtro25w9s6mT1OZUcSd4f19kE1VAzD4sMrv
	6w1h+1Pbq1wcQLsCZafzX8nMcX12r2bFLZV8rTDjOaES1xb5n3Hgsvfe7hdjOEXeVtsevXmKCg4ya
	uNm3oQ5yq7Deod6OxUId9vdi/KLgmsks2MJKbjsiTID2CkDEIBNJGQuRAFMsvfvYO11RfNWTCYVYg
	IiSlk6jmcgQODfdHgtHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJod2-0000000DmFz-46xx;
	Thu, 22 Oct 2026 08:58:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJod1-0000000DmFI-0jJr
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 08:58:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=XifzIrjO8Um2mjh4fUxoQvxrf1F5cyhzZDGnoH8FPys=; b=dli3Kb3MjgHRbtRIoYmOwAYMTM
	W2u1MWo57Bpxaud9K+em3x8+fNtgAKxcJIi9VcnVB9nhCHGpHTbgGbIBdp2kCgREMB9LpaYIn6qmq
	W4tfYrZK8Jxm/Hl+ysNf//By2r8diDS2DR7VHhpagy4LY51IZaLXz2evfpnFc9biC5LERH4tRP4Q0
	oFKkmziRnUo6AXONyKU9z2uk23+0BrALHJb1vqx+lbm/3Gm6oWaWPk8t4mHD4JkImvvPNEXqzVq2U
	dG2aRdsNSH03z657TqWv1GEaG68AdZ5sc/7w2Tfj22c32wgT23eCG5vVgtzRQCZJhL+txBezgsT7P
	DMRse60w==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoct-00000006hd6-0w5U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 08:58:23 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M7014S2714299
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 08:58:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XifzIrjO8Um2mjh4fUxoQvxrf1F5cyhzZDGnoH8FPys=; b=VW6AFGvidHvKBfhO
	WE2RWh5ufFFB60dLU7NsaPdLh0BQ7CmPsBiLA8z1hKO/mD8J+ncL8t2ggbVdStX+
	yNOPP50GMCKfoZV0KCNKWGtQ2n4WbKUcWN5f3NyQtd1353UuSqUAJiH6GDNN25Wd
	qtpM1Dq0SS4aN2/u4cL79iksf+oy5MNGrT6pZSvKU3UTsjyaNOQ7NaHKjcjZUe4r
	6a9OlV87KooNss2MJIbi5lVB6/xaP+Wx3cvMcb1YZDOMkgvtp+7x7dMsD05aHv/6
	a775mAlYqPyXuj+AoZUbEaN7z1JMUX8akZTW/axd+/isVjstbYu7yoOTbQLgvRC/
	jGzwfA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bsj39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 08:58:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2c0e6653so309363885a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 01:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659494; x=1793264294; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XifzIrjO8Um2mjh4fUxoQvxrf1F5cyhzZDGnoH8FPys=;
        b=LIO6HXliMKDXQaEg5cchjOq+G/OzMguN181VR3Buh8RtPPtThVIb+j7KZQf/ENQC+O
         ue8ApJxB+HSyXFAMnLtgEw8Oe4XlI3hwIlSNLastxqzssqN7z4+13GQGuJQP1Cry7QlR
         8zrpLuW6fLOClDRIRhSpWxFvwgvnTHF3CTQfa/Dv1N/OX5H8OS1CRvdlcmHv03b4QWs6
         D05GDnFl5cyhH36lJsQRcHDF5AiWgy3TNTw3jc17A3e2acUEuITwHpXR9BZ4N+HKljOu
         AkLy2d9mFw506dulQSE74dqXHmYQsmG9g7AVOXX35uWRwp8/c3qvr95Up3VgzNzEuijR
         huWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659494; x=1793264294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XifzIrjO8Um2mjh4fUxoQvxrf1F5cyhzZDGnoH8FPys=;
        b=rTUNUf1okNVzMz5zIYfv3WrvpEI8mwSzojsIO6h352bT58MTGeYpJPalbpMnQqn9fD
         9GpeB+23F+wXCoysIAj+dD1OPMAc2ggHnTyjP8AHz9ZEQhVSOsS4voPWBBjDbEZQDTTf
         Rwni/iEt891CyUnc63+HpasvqPJUMjA3Z2kPFxwSa8W5BBr06f5RQ7lm4LIVIw4cmNMw
         mdem0HFg+nvY3bbwki7tftq/jiT4BFfQl6rMa0oWnYeZCYfoZs8+nvGflFPF5aukQIpE
         87YrVQYjya/UxYuMXw3nd6OoimYGHuvWgLKvuxHAXaeAVYEA6Tbsm8Dd7aciYgedkBgJ
         7qXw==
X-Forwarded-Encrypted: i=1; AKwUvByN6higvXUCUbbD8pfrrx4Y6tlzc/zB3zXg6KifA7t1ItEzRFKSyQXS48vKUwTbxjDTmAaoNh0xLyG6OxsKeZjM@lists.infradead.org
X-Gm-Message-State: AFq9FYJVhz5BY2VOAaljPz39VuRoKhNN2h74rZgifdhqVBrSvcfdHo1R
	x5eDb8MumFVkWlD290cCqMMmJr/zjcCHEXqdR8CpRsaHbm/48ChPWvsKYOZQJeiX1FRcNWRfAI/
	10lJIXT7UyjcOzIbSNvC8P0EyFB4sQGvuxk1GSLKUt/oxoiDRnMclAv/CsnzSU7IIqzwglHMKyL
	uCDQ==
X-Gm-Gg: AYBFou3XEV+yPZ9THNo3I7we+MoeAFWeNnMVjDztOQBepagZ4vHv+DewP7CX4ojUupE
	8qmF83fNTMKpzuBWeDucyJzHrgj68sx5pUXGsfy37sY09YV63apQYoVtk0YYNBN3iTFwfhAYK47
	/sJcYHoKca9We0NZ2A9ey2unHqEu4Pui0LO49XvfDivO7KLF5S6X8VeJ9GagFtVrnV50cgbzmlz
	wUEeNs0T9s5klBXkV3pv1W8v38i732IcmKAtUbRL6ZcvR0sdGbiILAXzJviuKcvitNA0PLFKq7y
	nRNwv32BS1UjMwerYgP+JSu4GCOSv4qz/XJWdi6owyPeOqpnSPnxSqPZuFDZSE/f9w4IhDn36eD
	/PADZWMTQ5O88Ze0kVpbU7OlgEEqH
X-Received: by 2002:a05:620a:a89b:20b0:93f:3120:6c84 with SMTP id af79cd13be357-93f57f1cc67mr569442085a.36.1792659494222;
        Thu, 22 Oct 2026 01:58:14 -0700 (PDT)
X-Received: by 2002:a05:620a:a89b:20b0:93f:3120:6c84 with SMTP id af79cd13be357-93f57f1cc67mr569439885a.36.1792659493799;
        Thu, 22 Oct 2026 01:58:13 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203b28f70sm61625525e9.4.2026.10.22.01.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:58:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:57:59 +0200
Subject: [PATCH v11 1/2] crypto: qce - Only register algos if the user
 really wants it
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-qce-fixes-broken-label-v11-1-0d33c34fd0c3@oss.qualcomm.com>
References: <20261022-qce-fixes-broken-label-v11-0-0d33c34fd0c3@oss.qualcomm.com>
In-Reply-To: <20261022-qce-fixes-broken-label-v11-0-0d33c34fd0c3@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Russell King <linux@armlinux.org.uk>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Birk Skyum <birk.skyum@pm.me>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2114;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=W2vrkLJdRUgwbRgUUdohghAMPZS39GSW1r50SY5zt0A=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2dAhq4Y5Rmrd7hbC87snEjHpGkuQUqK4WRtnk
 NxCvMnPL1uJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatnQIQAKCRAFnS7L/zaE
 wyMoEACM4oZvzD9i8QC1aYfvOs5DajtJp9MEM6MGeKA4kxme/ayD10a+lSzmOLT/EqlYQz2F6tI
 RF0QNFJgnPzxzkoZOuTXRRq4+axxcWxnuSxhXsbwxCf2KJtw4+LqwKV2//rKjsiMGuGjAY4rkb8
 45VFhuktgEGhyWu6mMRywmgIXqI7q8hWOOLuExFo2zCj5ye5PgxmzxSqyswJsR2WjWVrZwthSP6
 W3uNPvxtqc+vzEKm83IuL/HuKJcjccBbNm//v1xnGGvw+doBuG1sz07ni+CX2o3G0TJk8GGZ1hF
 VmlDJeKVC+0fqejZvvmyWMrGLQTIK8h/Qa2ORWR7OB1NFOwoX2uB0z1cEI3Fkkl2W/CFFNN6Dyd
 xbv+B1pdCNjdLkN3akbEkzsl80K07HIPD7+Lp7PKnP8j/ZaWX9SpWlJtu6u3Y3s24nWb4xAAc7E
 hRNpyXc44jUJWJmRxy8t9bBS7WDgSTNpycyyNZqjHfBpnWhhd8BR3VQmaI+MOyzOFQmaTPgaHrG
 4oK9ehRydsGwNd/D1OBR8WMjgjidYafL4RIiBzQiJBXlVyKTS+lJp2bjGJF3XJ4w9cuvh3DSdQY
 qrx21B+XD3kkhKDJJPr5JLue0ZfXG96/3dzgZLM1eDc1siik+1vNqv6YoR8eJKFk1peVjSZpKJ1
 AO7u43TGZxiZ0pw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: r1frHDY_GUB9M-aVfczn6EjzonNMltsA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX6K/jFWwjIas0
 k8HyI6npwcbNbFyPuG6ZeXdA28M0BLGc7Bj+XvsuUpdp1Idb9ukDCjo2yMoQUsPdX8qXXrbJ6ZP
 Aoi1hgRFlUlm3tAfABPwvFAoouzSxpHHTbAi5LjPI7rIqVF4ki/22lt6oTdS/5qk3tniyGDNs6d
 COMesy/pJJg3BKI8EziH5jFC+i+8isSlMjSgXyRRNTMwXhQXMhVujtPMxyiZql2qc2YadhQj7xh
 Vexz8fwzMfOK7C0tvtmdUXk8BWgRuPRKr7YNdp7Ak7PO8jqo6YIiTj2ap4Ey3tboEopekHsuk/P
 u3U9nXxuUSdkJC1CYPJ5WTn1DUMZ35AXIbUu88AM3qWgsrCIt1GOi+by62z+b2I06xo2NKnFpEt
 Z3dFD72YTJ9cUHvGgIXVML9eLmRoX++I5AmSP4CQX0FfkVjQDrHRN9aBgCytal2Lr07mf9kXSYg
 cqitmffMAog17OwBoBg==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ad9d026 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XywcRVADl8Xu_msC9vwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX+6NsKIXRXo3m
 jPV0rSdOQ1OYL9qBuyHvhJYHCqG0sRGfdpV7ka7mDl5GPEGkMOY3kYB7y6ZHjCUjNauqm5smtc4
 ZJQwCdwXln9X8BfT3/Bfg3SB4+mLGsY=
X-Proofpoint-ORIG-GUID: r1frHDY_GUB9M-aVfczn6EjzonNMltsA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_095819_738474_D60CE175 
X-CRM114-Status: GOOD (  20.38  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This driver's crypto algorithms still have a few issues that need
addressing which don't currently trigger any self-test failures. For
that reason: don't register the algorithms unless the user really wants
it.

Add a module parameter to the QCE driver that by default causes the
driver to *not* register the crypto algorithms. It will only be one if
the user explicitly passes the do_register_algos argument as true.

The power-management part of the driver is kept as is to allow scaling
down of interconnects gating of clocks by runtime PM.

Cc: stable@vger.kernel.org
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Tested-by: Birk Skyum <birk.skyum@pm.me> # X1E80100, Lenovo Yoga Slim 7x
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index bf3c1bc3ba7bde5e5d08e06071c67ba77af95695..5b1bf7a50f88c890da1f0820fb9e070b3d3f4708 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -10,6 +10,7 @@
 #include <linux/interconnect.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
+#include <linux/moduleparam.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
@@ -22,6 +23,9 @@
 #include "sha.h"
 #include "aead.h"
 
+static bool do_register_algos;
+module_param(do_register_algos, bool, 0444);
+
 #define QCE_QUEUE_LENGTH	1
 
 #define QCE_DEFAULT_MEM_BANDWIDTH	393600
@@ -259,9 +263,11 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
-	ret = devm_qce_register_algs(qce);
-	if (ret)
-		return ret;
+	if (do_register_algos) {
+		ret = devm_qce_register_algs(qce);
+		if (ret)
+			return ret;
+	}
 
 	/* Configure autosuspend after successful init */
 	pm_runtime_set_autosuspend_delay(dev, 100);

-- 
2.47.3


