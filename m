Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A9D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 15:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uCKnkq2w;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QzAcC31k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wu3cUv7G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mVhCdDkhAXJ5S102mixnITdimIHOTHoGKH57O2P0pYk=; b=uCKnkq2wlDcmLj
	Sizzov4ekrUXtscMKmq2WCUMV+tmOURlI0l6nE8Gyx9mLkLQSA4hspxhRLil7IjVwMmPidIrj+TVP
	r1E2hTcCg5XPLwjCebh6uvGJi/pQs+11ja0XRoNoG/64zpm3BPED4SUp4Sq9622sGGFJd+K10tKdy
	0G//HmthSf5P0XAO3UCy7kojR7EaxLV5HEHTLXG4w+uCKndexyXL/ZzYvfl93/rcCwlYy1wmkZsFZ
	YQkbuCzKu/Cv1WWVcXjmcieq6DPNgWTVr+RgGfs7rcHrCzIqVNhdCWKJ8X6PlC+iDoneog4Xh3yoW
	H/Fh+kZAnlJ5ISiDTSyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5A0-00000007Hun-13gn;
	Wed, 28 Oct 2026 15:01:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM59w-00000007Hra-1E8u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 15:01:50 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe3HY4154763
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 15:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mVhCdDkhAXJ5S102mixnITdimIHOTHoGKH57O2P0pYk=; b=QzAcC31ktlmC2cCS
	LDO9UhLMk1H9E+JsuvEJv90SGUuvR0kWdzBFd1N55Vb24qADIf7fO2YSfkhikI/n
	nxYoIzBAJ8kk/mBrOS7zHyz3FZQdaReG04rLsVn1rjqhuZtgP+5gnOgEmD+yqkHg
	oxq/5E6o7WSEf2GgW/vqS/Aiw2Hl6I9UKBOEgS7BawkO+4qzhtuu6ZauV8oXHuQJ
	2ImL7ZP/cVrLBQwYGAwanwzJOnRbK8qOFEFKpsABU5J+EbsrkUf27tNh+uY2XNPt
	h/seLmU0kxBFcJ/VbJmDkJVJkTsnDPrCW5Fynxag64BjuXE12UaCuQ97zXxXfJyj
	qbvvAA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp1e7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 15:01:46 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-824cc5f7fcdso1447940a34.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 08:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793199705; x=1793804505; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mVhCdDkhAXJ5S102mixnITdimIHOTHoGKH57O2P0pYk=;
        b=Wu3cUv7G0FJdv5780BozVa6JdYqC17+679qXVBjJimHjxx+G4jrKumuk1cMrufzy9o
         KvkBKi4lMrYwya6TGW7GG1OeQsl+6xXGbT5Fgpb2Cb1bGdcuDecTaW3hseIaNw55HTrx
         7IJfuo4rLqmK2WZISaO+z1ldlqro/nCleLpGypyrNDLNHuNT1vlK6zt7sC6qoX5bGaJ3
         JCr2QflnqsLMHNJzyJCk9m32lBp8DbK0W234gO1oc5GuWdaqhhXxfk328rkN5WVir7Jk
         CBXioXkooOOpiSDVsfNWMrUB7ycthKZIm6dbOq87wVfD+s/r/gyCj7TC7HaXnHloF8ae
         WSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199705; x=1793804505;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mVhCdDkhAXJ5S102mixnITdimIHOTHoGKH57O2P0pYk=;
        b=UQ/yOTDS51Q5zp0PDhHowxTNbd0LPak4W5K+0MlKtXm/u0CuZ4nKWljaO/Pjly7X4v
         txdOYlFroiH/s7VlrCm0ovENcqjzU7AiHFUHJDadDZlE20lA8wRWP8Xr1x6BCBiIZkNw
         5XAXtosdCbBNP8HZ+2h7j7sVSKnN88oyBDuP1V3L/7I8EPnq1kVwcLOUE6G+Wb49pjzD
         5fdP2cmCo9Syh1V8spFOAe1h1kqY0zCraT8x0I/q9rKjgYu5Jq86YOKaRXSUuae+10T2
         4zSfk8GtbC09xDjV2dBCX2bAjKRK7jQjKOn52aOxw+A1NuAtW7PcPuGSUu+/KVwKF/88
         t8Ig==
X-Forwarded-Encrypted: i=1; AKwUvBzbKvhakN+RuiU2Cuf607FErEqn+TH/acGVu2decvAWt5ol35LV9baD/mja5aVfofEhuEWL288xzZFaeLEhMLqS@lists.infradead.org
X-Gm-Message-State: AFq9FYIqM5mZrBKYUYOlbWfxdIwC2PqetqJMTlaEj90J29QIpnpbublm
	3IIl9E22SDE0HQGYX6BCaby+TrJ9/w4UHKVoRU1Qb5XNPIZ+UgL+yzRREzW7/b1z7ezzr6iecIJ
	uwXUD9LWCzXJThe11ebwhiS4LrurwPlfP64j/JFJV9qnkcem1haxtiGdatOFsXYw0fK7MnoOCs/
	S/bQ==
X-Gm-Gg: AYBFou0DW2WfUPCbkPp7b0E8IlSdEaJioF7AU+mhsoPna+AcYrpWfS5DOlbuc27Vjyv
	bzK6N11cz8DbXazS2xf4DOtd6Fyxc6BtELoJqkBV/knUmmlLQg4eReI71uUIHMklKudA3MFtUJw
	FkUsE0ZZ+MtK6DkrtxLmKIDZ64qIWmH4eGM6KSbHLkF0rTxa3w665tM2ECpgz74qxl08c96ffQu
	mITNzmXiNC7KaDb9MB3h59k6uK7vVymNOsx7cwJrGEh0wkq2oeYtpLCOhWdaD//YqOM6ToNVhGF
	xuy+7UGbYDcDsCtSxj3gWjh7YR5ZBdljXdaXbOwZvH3/wSM/CuhDqIW7hsI9H0wrEy1E9ybAdJS
	sqt/dMr60JnWarwJV5fytQq4HK6aMhLL3YZaKaUa3dTWyOD0N9AIFj4KOXoCPxtNuX1SweJLY0g
	1zG8yXmlnyS36qEph8H/2sksyCclWW/T1Zag==
X-Received: by 2002:a05:6820:a65e:20b0:6fd:4277:16e8 with SMTP id 006d021491bc7-713f01edbd4mr1002286eaf.80.1793199705256;
        Wed, 28 Oct 2026 08:01:45 -0700 (PDT)
X-Received: by 2002:a05:6820:a65e:20b0:6fd:4277:16e8 with SMTP id 006d021491bc7-713f01edbd4mr1002259eaf.80.1793199704670;
        Wed, 28 Oct 2026 08:01:44 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7142d317adasm1606578eaf.14.2026.10.28.08.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 08:01:44 -0700 (PDT)
Message-ID: <d094dc46-760d-4ee5-9404-9fa73a16a6bf@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:01:40 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] wifi: unwind failed interface setup and recovery
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Miri Korenblit <miriam.rachel.korenblit@intel.com>,
        Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Shayne Chen <shayne.chen@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ilan Peer <ilan.peer@intel.com>,
        Gregory Greenman <gregory.greenman@intel.com>,
        Deren Wu <deren.wu@mediatek.com>,
        Ming Yen Hsieh
 <mingyen.hsieh@mediatek.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261028050337.127464-1-yaojiale02@163.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261028050337.127464-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6f35ctSbizo7Z9lXv7thlSF7YWBIqQGY
X-Proofpoint-ORIG-GUID: 6f35ctSbizo7Z9lXv7thlSF7YWBIqQGY
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae20e5a cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=JmONO2TMLgSK87zk2EoA:9 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OSBTYWx0ZWRfX+/Zg3PBbid9u
 wZEHypzbR1Xv0LZToLGEvpmB/0r3rbE/bjVo/9ymwjox4RhWyZMkRlurg7RkdjZqOYC/N7cABWv
 jZR6r8R8DJt3cCkuZSBhugOiVop6AsCdDAoIL7WOn4eRjWopFNjkg3bAvyeQm2e3KctuoLRlN/l
 Tg0HAtcBqG4hStUVFNgI1uwshe3hlE6zeL9Mmc4hrUPd2cPJHC37d7taSbPlKJ5p52KvluO5nJj
 OB02u/44YijyertKQIi0NHsU9nrkcJmFB6dYtrSlCZ+mVZ+ymkb0eOV23pxdpQnSR7ufs8l5jm0
 DnUhQtXRoVUEHlO73uZ9jlULxGPWXLKnwlCjdZQZDpOpEdMeyilhpo3fNvEGS7DKN9QcPci3jlS
 ubGLcB2yJW4s0awBNo0koFJ3NBLTj8dNx5aRSFQt+z7cmkS8pzl4ofc1YSe+WQn5o/jDOB4LZrJ
 36aIy7/ztE4u1N2tcBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OSBTYWx0ZWRfX2DkFeTNtn4lM
 BoVwON4dVi456/rfegbSjkF6C/LQKM1GE25yJz74/P9CYc303ZNnsfoAJmC5UBPDXUVWidfPKLD
 NApJQiw0snSYQ6JxYtQJLIYkmqFnyFk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1011
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_080148_524043_C7C68226 
X-CRM114-Status: GOOD (  13.57  )
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
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/27/2026 10:03 PM, Jiale Yao wrote:
> Several wireless interface setup and reset recovery paths publish host
> pointers or create firmware state before later operations which can fail.
> Their error paths either retain pointers to vifs that mac80211 will free
> or continue after firmware interface restoration has failed.
> 
> Clear the published ath10k and iwlwifi pointers on add failure. Check the
> mt7921 and mt7925 firmware restore results, remove partial state and stop
> configuring the affected interface. Each patch fixes an independent
> driver path and can be applied separately.
> 
> Jiale Yao (4):
>   wifi: ath10k: clear monitor interface after add failure
>   wifi: iwlwifi: mvm: clear P2P device pointer on add failure
>   wifi: mt76: mt7921: unwind interface restore failures
>   wifi: mt76: mt7925: unwind link restore failures
> 
>  drivers/net/wireless/ath/ath10k/mac.c         |  1 +
>  .../wireless/intel/iwlwifi/mvm/mld-mac80211.c |  5 +++-
>  .../net/wireless/mediatek/mt76/mt7921/mac.c   | 16 +++++++++---
>  .../net/wireless/mediatek/mt76/mt7925/mac.c   | 26 ++++++++++++++++---
>  4 files changed, 41 insertions(+), 7 deletions(-)
> 

You are sending patches that fall into 3 different maintainer trees in one series.

It is much easier for us maintainers if you split your patches by maintainer.

/jeff

