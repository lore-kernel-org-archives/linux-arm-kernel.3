Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81C6606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 23:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gZmVjVTy;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e+8ZH3Gz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KhKMSO6l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2hpKOPWbbpZtx65mqGSUrHqwHz0eW4DLpqVbN8K+PsQ=; b=gZmVjVTydohZhUqxuoVDLngYQx
	Udf+ApyWstKy6r1eGJP4bwPyA7As3pR2bQVEvRjXncrjvANzP2NyLRJc4JpjnDrWCYDfd6xNb7+0N
	GOvKl0qYlv5qmZYxZIVGFZKwdspPjo1mFKvl+FfYJrgV4sGNLS4pB4zvIGSrBRItY6pQofsmcm4h/
	baBov2GLDmltJqBj7duLrj3UUcI3KHMUBSIcBEopBq5iyKZT+2Hb+bGJKdEPoEDNZCYUU23iH2c53
	D/LoGiN/6H6qRrGA/nSVpXFOA0n9+L4Z+2nTw3TlbyjUrVxA+5/NhqgauxuwtE3+ijrCvRjUkEjra
	Ly1IxAeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1Al-00000000cCQ-2oa0;
	Mon, 02 Nov 2026 23:10:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1Ai-00000000cAX-3GJ0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 23:10:38 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K6Ae2372213
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 23:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2hpKOPWbbpZtx65mqGSUrHqwHz0eW4DLpqV
	bN8K+PsQ=; b=e+8ZH3GzmW0KMCN2lbOu3nwAEU8klFpSYHiNrvU2+JzenL3a3sZ
	RkBnUwaAg9HYZZ7YLDpgJ6IhKtRkueoQ/rjCWTcwyfpnI+EC4PvV3weQ00NyxNoP
	4XTdwCVtD5CqQO6ZCIFkdkQiXHVJ2673nOxWQUlo3Th/5uV3V/fyk24LNEVur9LU
	eCGCexERjBP2dcLrmIQpBmqKz6b4hJpaFxI7ERkAMvxs7bUS0Ynoyr5BbPx7s31F
	CmoKSeHD3xBdmqT4MRlnN7SY1Fdoc1Y5fd6FOELDP802UCaGTIKdsJAWYqA1Igyg
	eK5X4+Kw+gGuQzfK2XqXMwuvjAsFhSXoT/w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r0w90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 23:10:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2373e9b4so356342385a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 15:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793661034; x=1794265834; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2hpKOPWbbpZtx65mqGSUrHqwHz0eW4DLpqVbN8K+PsQ=;
        b=KhKMSO6lDo9C0bDRyCyp1+AhdQka7zTNIO0OgG3F1+G4m1w0Kfmpg2LkWG5Qt0mFg8
         TgodMTsMlTx/+sPmliK/kFo+MPhMMUacw7w2Lh9PwctzZkSA0P2/t/3iAzmJKSlfpman
         juyjwZZfu6IB73wVHOXO3Wr9QT2sM3/Uve0od0+VFAMbYPI1lSxyV77YEoE2lAFz0CIw
         cZTTu0Klvrd5Oxc3SuFPWEOS04LVLZu6/uRiQKsu87rj+WCTsmxrqV/T9wd+I7iqHgJL
         NFTexXT7IdWz5EspDses6inMOVr3wBNpxUy7T1fd72SZ4OkWeyGWqRBe5zfkH///Xg2r
         DE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661034; x=1794265834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2hpKOPWbbpZtx65mqGSUrHqwHz0eW4DLpqVbN8K+PsQ=;
        b=1/7WGCyHE5XjAw9O83rFzO+gLL5RJtDwLunHyzD8WeWt7z2Rq/OjSYOwC88kV9UmL5
         8/EgyQJ4YcIzA9Ripj18Wm1SmxA5ZANw8hqYVEO5DBt+V/zisDwmjUkrc8YQ3MGYv/mm
         YCiLDR+5PCPy7BRnNdHGLAj5zLBaXamNKgW/eC1MfQEIjKuToT2RvkYrdU76rUdgkNws
         DKogHkOTQibrUc/UHXTApNTHy5plbgIaIaS7ahqIKpy8kZzINa4TM6Wy7fEXaLE0A8WY
         EjdYjWS1XT+6mX04ZfEU3Ccj5FnGmuy7wnW4eD3lxq+MYpm5I3Y/faJOB8Tp+6GwlCUw
         fHOg==
X-Forwarded-Encrypted: i=1; AKwUvByrmqE54AkHU8TWb4ua13Zoizc4JJAHS9xjBxn+uURFPlsj9ScZ36CSqmqfifUvwFN+z7kxD0Oe3OAnB7U4VdJ0@lists.infradead.org
X-Gm-Message-State: AFq9FYKa64kf3AXFefwc1uvmPm7njgSsGRlMysBloLG7P8S4ciRpBTIA
	C4jrjdgRojENUjmmP8GnDpKGFgA6be1a9DaxdZCB4wDtXqyJTgmyCCO0R3+Q/U5RURUu59Qihcf
	ElwGf4q2pkjTXb4bPVJTBC6534SPL80+Ak6XOkb4bMq/dCIo/JD9qOl9C+7bLS32x+UimIdROD/
	pugA==
X-Gm-Gg: AYBFou16yDD8uauMlBGId2BjuCctKqQz4aqcNxb9tB9vef6tC3AdkThXhTXX76+rqu7
	d553v09l5QqlNRvYjeca+wJkFp4KLOSq78buWg34nb6/I5lWgTVDZ/iaw8Au4dMYcH9h9UREsNN
	eEVWiT1f4E8Cys4dYaWLJfLRIh2ZsBilenPSSj6q5ztJUIgztUhU1lewAjJxKZNpdqlUtc6ERNY
	cIPiyZ31uhI9h5JzlYYWEf90+Nn5U72Eb7M6HK0dWDRPGQHx7dqgYa0OJpwRwctDLk4S/vfv7S5
	zklL9Y4jPIKUXNnooa+vIdmKSfY/vL5z8kM663wOAbNzUWjS6/cbC3U5NpmNC+ArOpL0lj5+O0z
	smLEIjPL9teNg6vAWQHrJcBXrrJQsyPf2t92byGdxBD/WhHNrXnrYHwpf2nl/b5nWNHxQ+LVXJp
	Fc
X-Received: by 2002:a05:620a:472b:b0:93e:78b7:fa4e with SMTP id af79cd13be357-944216ff106mr1886016685a.37.1793661034313;
        Mon, 02 Nov 2026 15:10:34 -0800 (PST)
X-Received: by 2002:a05:620a:472b:b0:93e:78b7:fa4e with SMTP id af79cd13be357-944216ff106mr1886013585a.37.1793661033794;
        Mon, 02 Nov 2026 15:10:33 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:8b9e:7797:dd05:11cb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cf248sm25198725e9.2.2026.11.02.15.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:10:32 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: akpm@linux-foundation.org, rafael@kernel.org, tglx@kernel.org,
        peterz@infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
        linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support)
Subject: [PATCH 0/2] powercap: idle_inject: Create threads on demand
Date: Tue,  3 Nov 2026 00:09:39 +0100
Message-ID: <cover.1793660202.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yCTJK_lVs145bLcWXGkYU-6NkhLzBlgF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA5MSBTYWx0ZWRfXz2ZcgJwgqxn7
 R3B/HRkPxNkusp0s+gYRTIBewg2EqJKssclRYHP9EX47jtOEmIhYhyiebrzBac2Q+f1/SDyc7x0
 sf/GFW+Yaoil/lhOIEALQTcjBK9HJ5nzwrNEO2/V0lKs+/tDmx3aIgWmqk0+TPjkjHkyAuY1wU4
 UXqRGoleNNAuN1aH8Ta/hAyEWVYVQpL7UPzJLaXN3zyN2BrdzisLzQYA3trBMBza/jxnxgzTY42
 U3A4DpOBNXH6V9xwH3bEAeOmjtx3xuHmhPD47VoABoKpk3jAaSkNemu7d899AJm0qZXRzSUpxxW
 yAM9lelIhN8MCrh75Yomx2Rzl5r9QnYz719qIdqUzysPFQQYy/SiKMyvv/TXymqJxiSsHipIqF5
 /F07/Ze2JdVG0nfIm2owkfO/+a6k3Q5VOjBDqCiO/0DXZmKvyWp2brYXReWxTAbUSvCTLcsS/5L
 3+8FccB57IFdTI8MaJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA5MSBTYWx0ZWRfX8BI3wt0WRWnz
 7rn9gXl+eyEQbOULmc/+Krfq092u4aVRhsAZuDspijajKwTgKeQgd9O+gcZOaIqwDcejR4GmAa6
 SESclZ5znZJImbAPpb2qFiUBlSwo/F0=
X-Proofpoint-GUID: yCTJK_lVs145bLcWXGkYU-6NkhLzBlgF
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae9186a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=Z4Rwk6OoAAAA:8 a=VwQbUJbxAAAA:8
 a=QY0LLLZMJg_iqbFvK2wA:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=HkZW87K1Qel5hWWM3VKY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_151036_928627_B5EDA03C 
X-CRM114-Status: GOOD (  14.34  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Idle injection currently registers per-CPU kernel threads during early
initialization, including on CPUs for which no idle injection device
will be registered.

This series makes thread creation follow the lifetime and CPU mask of
each idle injection device.

The first patch adds an optional CPU mask to smpboot thread descriptors.
The mask restricts thread creation, CPU hotplug handling and teardown,
while preserving the existing behavior for descriptors without a mask.

The second patch uses this support to register idle injection threads
when a device registers and destroy them when it unregisters. CPU
ownership claims, registration rollback and thread teardown are
serialized to prevent overlapping registrations from sharing threads.

Validation includes W=1 builds of the affected objects, whitespace
checks and static review of the teardown locking paths. Concurrent
registration and CPU hotplug runtime testing remains outstanding.

The series was tested on Rockchip RK3588.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Rafael J. Wysocki <rafael@kernel.org>

Daniel Lezcano (2):
  smpboot: Allow restricting per-CPU threads to a CPU mask
  powercap: idle_inject: Create per-CPU threads on registration

 drivers/powercap/idle_inject.c | 69 +++++++++++++++++++++-------------
 include/linux/smpboot.h        |  4 ++
 kernel/smpboot.c               | 17 ++++++++-
 3 files changed, 61 insertions(+), 29 deletions(-)


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.43.0

