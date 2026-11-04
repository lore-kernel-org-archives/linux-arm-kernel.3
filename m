Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E56606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 08:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lGVYIibS;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KmLQF2gm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VPGL/2yo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ALd9EXZe9YZwA0IXa6VcEJit4b6zz+q/woGhLln47l4=; b=lGVYIibSNzWmHQ
	bTfqxjANz+EH0HddXCWz8LEFw4RGSBK8plUzkB35tCdllsWQko9MmzltYUXYd0tvp3bSU3SOdPw6U
	tRVeQ9yQnkzk2qIr0evYgaNy0lTAlF/qvU0HpCE3tMYQNJ4tWb/QlFAi9TZUNIsyFJ4GFOvC4/uWb
	HkH856YOePiZ3tSHnPThGddHVLxpt+GBDvjlKwy1XayDZoOZSUDU3gwcGMdKvj/LYeTZivLwylJ17
	6np8kXJBWs6iQ1iaGqa4TnVgC9i5i605R8YJMI/GFK2mKn8Uew6K1yREp4MWL8B68bsjofoPH++8T
	IFLQkXBRLwRMjPZgACGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWdg-00000004kl9-3Vie;
	Wed, 04 Nov 2026 08:46:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWde-00000004kjb-1fV5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 08:46:35 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KHJo918303
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Nov 2026 08:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ALd9EXZe9YZwA0IXa6VcEJit4b6zz+q/woGhLln47l4=; b=KmLQF2gmCqRZyP7D
	W0wtAFgQPucX2w7K+DpNWG7JGPJQYWUZamfyMHf7Zg/9TjmJAJBKvMopsfxD52BF
	KigubdaMNXRZFPI7L3Dg0Sm8J/+BuOQnNv4K9RxXnzESo2+dV637qCTd2DVOm8Mg
	RMIjgcxkSe+g3m6bsAX1IvtYUnO6cMNKviOhtkIQqlynaf2AGRg/TLDvVnYPfB6p
	pAZ3cqZB24qgbUXpSbXDxCNlbrqYLlIoFbICpdS+9nZTU/xh3z2N786YuCVHwqoc
	dgPR+p31yjjUqW/hdZQQBGNSIU/yiIslquwUDFC+p7/tBUWssBpVZ+ivPxzNJJXn
	ycozjw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqvsg96f0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 08:46:30 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb45b4ed6bso582222a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 00:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793781990; x=1794386790; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ALd9EXZe9YZwA0IXa6VcEJit4b6zz+q/woGhLln47l4=;
        b=VPGL/2yo0IPmwakxlJa+4Gthb2XNhpowQyp0NMNJxyuKUOUHRIw6xH+6Vcmm8GbuKD
         VMqt0jwbkAP0fWA279oMLpKvIQwJsnn5fsIZoV10ALh+jVPvZWN3o446fSZmw5/P9P1T
         CVSMjTyFo2vN9gp4K5LMPFYKqDesGkODGCVRo40/zXiY1a/b8QCDQPYf1M1QpCFwOGHy
         1HIXrtBho9cJKaIc9f3cAd5gH3iHdBrIiMn0UN/6Pw07gv//sIASz8Vgp2iwgfye0Nd/
         /HBOv6yKXMxsF8jSr1ovy3FEmEc7uOVm6ko6PYijkQoth0Jj6jWXuZmGE906DXVLrw/Z
         13tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781990; x=1794386790;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ALd9EXZe9YZwA0IXa6VcEJit4b6zz+q/woGhLln47l4=;
        b=1SRGrKp44BieoBBN4PMypl6EuCCdoKicExnnYtA8+BdC432iIIZWM2tWJnqp7ryipf
         4bGwjytLpYxqYwTEyPxy+/sBtEAA+pgDDhwIK5rrbGpPz3Yaf4sKZYMgXgOkFU2wQqMk
         fE7w9ZCCv/g5dVGbaT+7viQKrpR/5cAWXX/ngHZZYo5Jcy/YaupT2/81/BZ2v+c/ulpn
         KiznWhiCEsQMYIdnacFdFNNzBQzaFzVGDtHU0O4o01LGLay8BAlqj8x/utc0Ys5ZpFsn
         YBBQBA3g5Z7K/nHW4VtzdJ9lS/xRdqGsRU9n0z4o1tWelNgApt5NIuYibkFUXRTH5TL6
         9czQ==
X-Forwarded-Encrypted: i=1; AKwUvBwj53FK4k8ihpGvtOKqF9NlmbiQFUV3niwW1wLEusVXbSg35vm6mq83poLMI/vktcdSxyPsfQoOXQAUsHAF07TK@lists.infradead.org
X-Gm-Message-State: APuU4Z+qUB3nxlxSqHxWiePfBUTCgPGdZ65FsZvmhST7lDb2aJ39ODbG
	c8NiWJYruU0lZighohCHWBk5Hk3/mt2a3jS1q/awSv/s/zWxHFyBwfIP7UfNGYw/RKzRkAf+tSH
	T1qcbQNtS9SWtZoyxL3uAmmgLdCijJuCGK33DnhelErsK0lDmXh+iKF3m6KLU+ULy6noDUqfl4X
	8BRw==
X-Gm-Gg: AYBFou1DdJ3Ep5qYJm+TuIxE45NrXaGwChyA9YDWAKhFIK+sjFJR542vrIsakymsj7A
	Nz+NbYoTiBMYzLJZhrslKZsCpzEcHT3FVOg4dipWsyOe/H/KljBc8RH4JSvLblAl0EGLvFzbeTk
	hJocAhfr4RYST5figFAnRvLkV/0CZrndW2D9Zrb0wQAePVwWvszFFc2FH4kHsb+uzUyNrYI+RRX
	850QKkvmmqiUo8HWER1o2xuiBTnSOyn/hPiXEz8MAzHrb33cvwuuxK4pA7JNRxLrjbNXy3h3254
	T3WEicG7jPmbof8OkZc26OAfpywGhK9ujqu6jP3Q8wDGD7CY9xH+FFu06yl0E7xIabopnDM8fsK
	uRZMByDY3NHQTS2TTlPa9NSRncGmJ5IVf9/yteXIDWHRNFFLObsauys6a+tyIKSyTvlslwN7aQF
	wvIbPC5lpDEfRCcvclQgc0fgJZuSJ/mwxT5Q==
X-Received: by 2002:a17:90b:3c08:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3ae89812f18mr13607857a91.37.1793781989798;
        Wed, 04 Nov 2026 00:46:29 -0800 (PST)
X-Received: by 2002:a17:90b:3c08:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3ae89812f18mr13607836a91.37.1793781989166;
        Wed, 04 Nov 2026 00:46:29 -0800 (PST)
Received: from [10.133.33.83] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0951af0bdsm3130106a91.1.2026.11.04.00.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:46:28 -0800 (PST)
Message-ID: <9d370f12-9e4c-4b80-9d28-ff8085ce3aee@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 16:46:24 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] arm-mpam: Add basic device tree support for
 resctrl
To: Ping Li <leeonion.muyu@gmail.com>, robh@kernel.org, james.morse@arm.com,
        ben.horgan@arm.com, sdonthineni@nvidia.com
Cc: andre.przywara@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
 <20261104081302.304667-1-leeonion.muyu@gmail.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <20261104081302.304667-1-leeonion.muyu@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GtnXaU1C c=1 sm=1 tr=0 ts=6aeaf0e6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Nb9Ewb-VQf6xNOhztzAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: h7Jp6A5mw5kIhlrq_R2djBkAeh9sFjbm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfX/j8JmX4RXRLM
 Czg0AEI2KZE8Gz17jCVdVmrtcdWQ9jQhBka6XP0h3qyrDSPSFhs4hCAbQFUQRag94n4UzfFV7F5
 ZIVIJDmyiI1IqVYnAKU8IssbjQKpVYk+NAvrFvl9mD2rBOjQk6FkzPhA95vuTOP5gzoCOlwhfQA
 dYibSgwjzHC7FOj6F34SLQRBY5u5F4WBWxxuzYSj8arFx5q+rMmbb7jVdHNgZN+z5BElpxez47+
 Cuxv6CgMGTYuth+73qsIVUJD4WCrB0Kkba+tv6v0tchxPz8O+42rjo/A7KB1RwLk5iLwPYSrxHx
 WDwUzL78dFqHH6bnxNuiGHyCHpBd/OCVqibgyItEM1uCctjSHB9TgPao5Frg4Urc/uEyjGUhUkH
 7tauxVWOqo1FJ2PI0pAoemonLMH8pShsskbaNzZa8bv3yiwAfEs3366Et/q+Ue7IqeCGxdNSznJ
 zJnSJUv1pfpdDWU70xg==
X-Proofpoint-GUID: h7Jp6A5mw5kIhlrq_R2djBkAeh9sFjbm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfX5AH6/6Sfr67v
 ZQp0kN+5d51UT6fOtzZmQ6YU8QN1jJfxp7NOKtkgyxyWMe4qgo2WTi3Bu+Rh7gO2fXyRS2kPCXd
 ASPk8DZAZNTKYsFBjaZ7Y1TEIrfULI0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_004634_553035_3590766A 
X-CRM114-Status: GOOD (  23.77  )
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



On 11/4/2026 4:13 PM, Ping Li wrote:
> Hi Yin, Rob,
> 
>> Changes in v4:
>>    - Drop memory controller MSC patch (no concrete platform user).
> 
> We do have a concrete platform user for that patch.
> 
> On our SoC we have implemented an MPAM 1.1 compliant MSC on the DDR
> egress path, which provides system-wide bandwidth QoS. The MSC is
> described in the device tree with the "arm,mpam-memory-controller-msc"
> and "arm,mpam-msc" compatibles, and this patch is what classifies it
> as MPAM_CLASS_MEMORY so that it can be used through resctrl.
> 
> We have verified this on hardware with v3 of this series (patches
> 1-6) on top of a v7.4-rc1 based tree: the memory controller MSC
> probes correctly from DT, resctrl exposes the MB resource backed by
> it, and both bandwidth allocation (MPAMCFG_MBW_MAX) and the MBWU-based
> mbm_total_bytes monitoring work for it.
> 
> So this patch is genuinely useful for us, and we would like to ask
> you to reconsider dropping it. We are happy to help with testing, or
> to provide more details of our DT description if that is useful.
> 

Hi Ping,

Thank you for the feedback — it is great to hear that the memory
controller MSC support has a concrete user and has been verified on
hardware.

Could you share your DT description? That would help us understand
your use case and ensure the binding covers it correctly before we
decide on the next steps.

Thanks,
Yin

> Thanks,
> Ping Li

-- 
Thx and BRs,
Yin


