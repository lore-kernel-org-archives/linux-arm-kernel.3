Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843FF606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 18:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=adZHJYAK;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RxGMeAKS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zz8oBjMA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eXSI/tp8V3OO/XBbPjfjDDVBAa4yWWkb3/wTplNoQFo=; b=adZHJYAKDn+rBx
	c7g9td8sjD27DBZQGDvmdDHxwGFcK06s4DfWMyFIo5EbvhN9gfLobkfaWSVflnmdpy3H1Jhl4xWAN
	rDSeyYiQxi1RDa/y57G3NlNxQnXSgTGDAkqEsM1LqueFSCQsNT7QWxmBD/2Ny+dJeWiBTgNUMAWvd
	JtdTxUzpPzoe95KNcIkFpEOe/7EejKKu0k8HniLfyH37loatUYP0NwYaPsGi2ILVggYtaocyEXep6
	imq/nK7y6abtl/Y1RGOcweT97BwBxRPkDrJ6HpxnhLIy/+c7JZ97bAhz/IFXkfSEaiykGzSaF3nqt
	w5d0rH1V1NiNDTPZ78nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2Tv-0000000ABky-26yM;
	Thu, 05 Nov 2026 18:46:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2Th-0000000ABhv-3BVE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 18:46:34 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeQaP4075323
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Nov 2026 18:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eXSI/tp8V3OO/XBbPjfjDDVBAa4yWWkb3/wTplNoQFo=; b=RxGMeAKSj1hpLsLD
	SPuTURbUXc0fODCQAnPdOdri6y82vH/dN7NmgthtQb2xdT+bSbKmH+enI7gkpet1
	ApEOmz9ARwk64d0ftyGtAStmrnLrhPdvEDcCPHRWuxSkBw4M9Kv9+Mk95b+ceSS1
	hxOy8JKYFQi58GdBswd5c+ZOvoOM2wFowYmoDGOmli3UWWY6P6fpbb3iRosSn64b
	L6kGTkKrL4pPrt5djxvVjCLvbEs6+BGdv68l091g4TMQ2KdraJVjI/1/FRVIWSMd
	W+kpuhrW0aUwvgQ4jJtGCCKFN1tBf/wH/3DwdnZU4AjdK/nQhBpIZLEq8cko83nC
	okol4g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrrkdt2qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 18:46:25 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98a9c848bf0so534392241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 10:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793904384; x=1794509184; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eXSI/tp8V3OO/XBbPjfjDDVBAa4yWWkb3/wTplNoQFo=;
        b=Zz8oBjMAMe+vr/yEafnyBr/l2cJ0jo1tQjL9g11vce44WAA0T5kFBVyZzjOzydp1Wj
         mqHbGEfe5qgrGB7dmbHAmv5tx5a1BMRe7/+dFuP4ExomaY+mTV6ObfFm8cosL/bRbrwE
         UtqWZV4adMn6reKxmyNdfxl9RjE9bK2Tsf8NPz1DOCzj96DgDi99BIlD7wwf7UUjFzAT
         z739ouGsfPa5d2tZl4Kuvs3/OhfvIwfMpSSm5kpXD6lHYssFJhF2JA9FqW4qHr/vmWkN
         PGbRmNCr3zR64TaHs9Emf8nNNE9ckTElh2ZN21i3hbiqqYWwvosyVe0CG8QIxSKaulW4
         Sxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904384; x=1794509184;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eXSI/tp8V3OO/XBbPjfjDDVBAa4yWWkb3/wTplNoQFo=;
        b=ckK9/RbDjrFnDQ6O1mtgUIICAmjGbpPuC8ONKPf7rWA/Xb1wyjXDh06BF9a0k9LAmq
         tP9gvBQR/tH6TJ8oTy2dM1jA0RwjmEzYxUrbdgkyf41l4yYpbWPvPwcDgGVtEWNjr6GO
         S31gqZxH4YIEj9tlp4k9s8bfNzmvZrOyi/GivzoCHvRPdYcZSwmNAO0TIJynFJ2cFE4Y
         xdZ7loJ+iQsMXC5UkioWmnOUEYeU4RrHZRpQKYFl6w+Xmi/v9JYuvFbgbpWJeBPTMBdQ
         fPg4n4C9/HgfZE6QQaLTyi0PVFIpACdkNkTHjw0usqknxnS8oy0Jr4Nkry25DNAaSqnv
         oZ/Q==
X-Forwarded-Encrypted: i=1; AKwUvByVJAhJwOXchjFtVyNglVMDgLiQjXkyjrv+aOioQgD2v8BlPK1FQCd/UjckXgxaQgieGlbxjtVsMBnTeNNmXrgk@lists.infradead.org
X-Gm-Message-State: APuU4Z/ZzgYqyZ/yhwOoC9CGEcwFt/GJrFKx3+Eks1rVNi0G6voqieFT
	TabP90y5aI75UW+CzJiIXAe55+6vWSU5oYgR9J+AadnBC0xlSA+G5hLsRCocyPkdo50VUPbLaDt
	PwXOxybwG0fPGrYTAW7tUPItvXyDtW4MAtsfqTBOh44J692CpFkbJd0heRf6Xthhap0cGtA51pF
	n7Qw==
X-Gm-Gg: AYBFou3NMYLQSnu6+GS9mD33GmbCBhlaUQy7LMDlTabLhuS6D4KRaOigAvELy/gs0pv
	xCxt0YcUIJAjKA1ccQJtkXiwoZN3Gs+FkE7LQlwz6dVufRk36wOIywr5VXH9V2dAKv+JGKSSXOj
	1mmslyVBW8Nr/l8aQ8L28rcfjlx4hmh6MoifFGUqzMGwLgvfJukLndW+lAVx7HNAEGbsxewFc+9
	/j97paOgk7zLNrBuL5qA5d4lXiyBljo10mWTLUYiYnHxiSeii7Uj78ThJEic/6E/btngMpkclV7
	iVQqE9IIp7Jfb1rV43vQyQod+AFIP/5asODwn12aSlAvV1Jh6cLwD8YC0mYu4qGaKDOjXjpeQpI
	rHVekpALoibU50gMQ5WvTJDx9z/ayA6nupmMpxdIDTaXg6dlUB8Ak5vhBKWPi2/6GyA5Y+7socw
	5ywI5ZtXjqqqm0SkVm
X-Received: by 2002:a05:6102:dc6:b0:7cf:61e7:e789 with SMTP id ada2fe7eead31-7d2a16135d7mr395315137.24.1793904383970;
        Thu, 05 Nov 2026 10:46:23 -0800 (PST)
X-Received: by 2002:a05:6102:dc6:b0:7cf:61e7:e789 with SMTP id ada2fe7eead31-7d2a16135d7mr395283137.24.1793904383187;
        Thu, 05 Nov 2026 10:46:23 -0800 (PST)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm12177950f8f.19.2026.11.05.10.46.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 10:46:22 -0800 (PST)
Message-ID: <493b853d-fe45-4058-914b-a9ee684701db@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 19:46:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] powercap: idle_inject: Create threads on demand
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: akpm@linux-foundation.org, rafael@kernel.org, tglx@kernel.org,
        peterz@infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>,
        "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>
References: <cover.1793660202.git.daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <cover.1793660202.git.daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Xd4cX455 c=1 sm=1 tr=0 ts=6aeccf01 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Z4Rwk6OoAAAA:8 a=VwQbUJbxAAAA:8 a=b9Gx46yHQhYJBP6_XqkA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=HkZW87K1Qel5hWWM3VKY:22
X-Proofpoint-ORIG-GUID: JLXGsW85lZHYU5zy5p8BQNil7rKVRxTL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3NCBTYWx0ZWRfX7lDkVWzY/WLM
 EEIn8da3RFOCCwuNhA58psJoSUssmw2AiRdq48NZzrb5hriSqKM7KH9NwUf4ISx9FfXGZexixBE
 VytLUZKbidSqj3onZ9/9qWFn7ZsnAPI=
X-Proofpoint-GUID: JLXGsW85lZHYU5zy5p8BQNil7rKVRxTL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3NCBTYWx0ZWRfX48YHaMuF3rF2
 cmDbJ6eHSgSwK5E7oj3MBscZnnCJXNVsyZLUdg7BnkiKibCR69UjoyMKOO9CeJnYGmhZYFcwS3b
 yCZOgIg3Bf8nya+ybPyt60JUhGjmm3LfJ1nph+5GdlIcfJZlQcLOzuM+kaTw++Db8c6z60gPlKm
 7ZSAB0A+MOxNacPcVzKZ4Xug25wuipTg6R3mfuplrQ3VPwvMiPX6o2bBN4Y8VWyobS/eiBziYSW
 tbWd6d+nh05ieE4ji/IPZopuxFBt3v8+2WRZchkaODouXg/UyGb6zVlfdZuIfXY77SvIMTVfCB0
 m2gEhhQy8o0v/H+aNGCmvUKMivkwzl0h3Y9hDNRwtMlVbeIpwgdPIX01Y0RFX9PbdENK0AbK7EH
 AXYiKzk7VHEEP/IuwA1OL1vPFWtcH6MorcS2b4nGfxtMDQm4Yavaoydf0QufVVLumj8yK9Ovx4J
 IRTQoRaOtLt7Gj9AERQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_104626_800102_3D3944B8 
X-CRM114-Status: GOOD (  18.52  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/3/26 00:09, Daniel Lezcano wrote:
> Idle injection currently registers per-CPU kernel threads during early
> initialization, including on CPUs for which no idle injection device
> will be registered.
> 
> This series makes thread creation follow the lifetime and CPU mask of
> each idle injection device.
> 
> The first patch adds an optional CPU mask to smpboot thread descriptors.
> The mask restricts thread creation, CPU hotplug handling and teardown,
> while preserving the existing behavior for descriptors without a mask.
> 
> The second patch uses this support to register idle injection threads
> when a device registers and destroy them when it unregisters. CPU
> ownership claims, registration rollback and thread teardown are
> serialized to prevent overlapping registrations from sharing threads.
> 
> Validation includes W=1 builds of the affected objects, whitespace
> checks and static review of the teardown locking paths. Concurrent
> registration and CPU hotplug runtime testing remains outstanding.
> 
> The series was tested on Rockchip RK3588.

One thing not specified in this cover is which tree these changes have 
to go through ?
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Rafael J. Wysocki <rafael@kernel.org>
> 
> Daniel Lezcano (2):
>    smpboot: Allow restricting per-CPU threads to a CPU mask
>    powercap: idle_inject: Create per-CPU threads on registration
> 
>   drivers/powercap/idle_inject.c | 69 +++++++++++++++++++++-------------
>   include/linux/smpboot.h        |  4 ++
>   kernel/smpboot.c               | 17 ++++++++-
>   3 files changed, 61 insertions(+), 29 deletions(-)
> 
> 
> base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222


