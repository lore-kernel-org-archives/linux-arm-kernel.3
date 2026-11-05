Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DEB606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 15:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ncRQhEDo;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YlwI94aV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BQ81RzME
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CVAkQslmMydLHpoDYQUP0g/AIJpYFwYWqZKMMcXJLaA=; b=ncRQhEDosED5ud
	3ZT/118PcYgOyTpf85a3ATbzE4UiXv8Y16p6/rhUkZqXjmO3BwdHfzx8AZJQwn+b7qiionuj8RCeF
	osth65GHQgaxti9+NfS9jv9t+27rCDxtA+AOTWx88XjazZ0eFo8UvKegCxIyahczG8pr4ZiCB0ugn
	H7x8Dv5JRGVfv6gk88F50TjEJlkB/sKjZjR2CmD3JBGE/5/4BdwWYEWhTpD+1OUKqrV/p/hqogP+n
	bLQCPVfSv7qWcXbc5yUF5lV8xw8EbeNNIqFBmcuKImzR2VCxN7Cxravs6JB2q4x+IHWo95ciNu0qn
	8eOvKFyvM3np+RcIsgmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOza2-00000009QQ9-4290;
	Thu, 05 Nov 2026 15:40:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzZz-00000009QPf-04gZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 15:40:45 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQV7p1657306
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Nov 2026 15:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVAkQslmMydLHpoDYQUP0g/AIJpYFwYWqZKMMcXJLaA=; b=YlwI94aVTLjkwCFV
	DWjRnl5Ypgt07KOpNnMNbM5XFKidQyV+uFtmpQvvqmflq1AuaAM+5ahEwArpixGx
	BsgkqbiDEiCu8tRB9d9F4m/hTqD7p+nO7fzvfzwArpakSK3MrxRbo2Sr6q/QRFlo
	tUwYmTX96EV91xlwz2QbLghTe9WlCmKQiv8QPkZ2VxvJIpqKZB33hkHn0ZtTpBqI
	8XnpZCqSRD4koDIPl7eYtZV8UkkpU1p5p+I/YNfzKFrnHb7oSjUIb3P04O1n4mou
	WjB3XiIFnNr9Tw5nGChoMYXGICji35sbxBK8O5Plh7B56C0ARNwCqp6QYTtGiLua
	5oDRvQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq9f9guh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 15:40:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f13c143c8so384492785a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 07:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793893241; x=1794498041; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CVAkQslmMydLHpoDYQUP0g/AIJpYFwYWqZKMMcXJLaA=;
        b=BQ81RzMECxoT54wTLKXLaVoWrRLMfXSobEKXVFAWcZJ2PKcDihfOSegLC5+lufbL+f
         0l5FV0QfnyQ+cOdjqWHF7emLLKkUYz4T3GTNdK7fXlvXF9hiVHqba69iIfsy811WACHD
         E6Rk3Ex83XlBXF58p/eG1NY9vHmb1yVp2pu/5+Ll5BigEqISPUn2V2JhqyUpkJDvHvPF
         xGoZIeRkVoP6qcoTMZ+veJDy1Fy4CIsXCLw2pH7d8yX9+Cvc/cXKlrq0l0IdVU+Ua4Fn
         +Cd7Xck2EpFif6CVkK9sZ2kq1e3fLPaOFut399vuG6E9WodlTp7XyNfY4gKZXgaJ3tSs
         ZBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893241; x=1794498041;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVAkQslmMydLHpoDYQUP0g/AIJpYFwYWqZKMMcXJLaA=;
        b=GcQqIiwsQjQxb3/NsA3W8CZeXsQA64f13GQKqZg0rd2FQuejndwZnioL4xFmqgCTwD
         Rpiofwr/yVRslVkV38iPgeME4nG9oT47w9WzUOXB3ZMcKGAK2XY3JBupaqIRsNPhXrg8
         1IrZoiHkBbIFmOKJc20wpBRHMR0hgwbQ+xAlu0qBRq0+eS3v5zf3wh2G/rEAxkzI4sWs
         fIJpm2hMvxEJbmcqh3i8n6KKlwkddxNL/9bsXiDS8dZENfZEhRe/ElReoqSf0swHXyAP
         pBspSaRRxpxspUebvCncLCJoeHIArtTJ2xB4OdXybyijgF/UNWnfvtZlPEwPX96AS1+C
         ircw==
X-Gm-Message-State: APuU4Z+3GrcV8Y0wuEZO+jRLKUV4VhYk99FRBjK/lwMecxxT80L8AkQQ
	j3xSb0CDXm70YzR5SNjgdDceSAvmCLf+9KNZX20rYmHPcYMhWrue+T0CHdGcqDABuNbYjelEZWB
	DrQ5cuvFdrkooKrg/aTOBdyiiM9xKV0RQOyVyJ1sMiOWHhvJ1OTk01S+LK23QQbC81At1YJjBvW
	Jh9Q==
X-Gm-Gg: AYBFou0NmXSaLBg7TDtadPSkK94AAGBsSGyaIfXdeOFqUQFdhfGLJWZH2ubeaIsVwqh
	eetGzw4dg1RiEg3GC86h/kBO7MMqEiEg5SvEPF3p0N0a3SSHRFgXh3eLtn+Hs5qtW/pC5/y95Wm
	Ij9VvlJRkT7e6DZUX4RqR244nP1bSNeHtVmVqIuIZ966H9jR4k0LSQmMKNjsAmBuJScI3F45WEC
	V1R4jbcjW9Tyv58ODohXpMUpd4BKaJ1+BURcX/ZYrPfmJ1yUyC3OxIriIZKNQz/u9jIQ+1UILbN
	h1m1c0S4gj+9JjTOCBkQZXmPvuQKMpNxstfzAfJbG1ExmgC+2wJrU7YG7el+gPLZUUV9bDw7GQL
	f7Thr+AJMPz4eq80YqQ31C2AycoqnbfmHroekWPFeVdUVo0wxufaACeAEvuwsLL8CIo0RR8YXQO
	4hfTfd8qYlE1dbN6AL
X-Received: by 2002:a05:620a:29d4:b0:943:f4a1:7bb9 with SMTP id af79cd13be357-944216efcc7mr3223702885a.18.1793893241226;
        Thu, 05 Nov 2026 07:40:41 -0800 (PST)
X-Received: by 2002:a05:620a:29d4:b0:943:f4a1:7bb9 with SMTP id af79cd13be357-944216efcc7mr3223698285a.18.1793893240709;
        Thu, 05 Nov 2026 07:40:40 -0800 (PST)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b414b170d0sm95732535e9.1.2026.11.05.07.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:40:39 -0800 (PST)
Message-ID: <bde5eafd-3018-407f-8b96-08cb04c5917a@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 16:40:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] ARM: configs: Enable the TEO cpuidle governor in
 multi-platform defconfigs
To: Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261105-multi-timers-cpufreq-cpuidle-v2-0-2df7a17f4835@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20261105-multi-timers-cpufreq-cpuidle-v2-0-2df7a17f4835@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MiBTYWx0ZWRfX7Xpk/LUDbL5U
 rSV+EvmmCXunl2GYscSaVHnoua4uher0HBMRUw91gPe6CC0O2BIWG6T7U695JA0P6NImiwG9P8Z
 v7wnKQ+WmNKAgFUEBgcDsfbjpXazeejE/ZinsecI3ajlIFZ9yut2HXSyphnSofRknB4Ik0i7Ofz
 t0HP0LwJf0XLv26oTLz1iZ2zHsUtffk2d94uZ6+DcixbG7pinuSEhFaUQyqDMBaxwd+t9kQlTMl
 E6TY1Hc8nHeRs35CXUQ6dh9zyTF2jdzCLM1YAKf/9T7hiFzYy/1YRtadXonaHYhdIasrLg3dE8B
 DroVbZiGhAh5yLUs93oYkCUxI1ZCBEaneRjB5iZrIx0Cj7pOFrMX1Dh99fHeJ9xBn+tFlX/mLvp
 b0UVbmHYbizAEwVPyhIDdKZ9CBEmRi38UNazAbX5w7MyTswqyJ9DknLvHXbwpPHM6B4dgVJVxvu
 9D8J/MFd1RxseTy/Oeg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MiBTYWx0ZWRfXxo7+FWOD7pCO
 sncdKDEjZrhzx2aFIx8SAx7d3+bPTpAgIHyIE1jn6zYSceAOFF1M3dWdBAwuTZeCddYSzOiC4vQ
 O4al3ACCwC33wzqdInD1ueeeEI4bteQ=
X-Authority-Analysis: v=2.4 cv=Vdhir1p9 c=1 sm=1 tr=0 ts=6aeca379 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FcKzS_pcoyWHRQSGzCEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 9wS60gSEDE4D2srM3QN29R1uEtkiI75q
X-Proofpoint-GUID: 9wS60gSEDE4D2srM3QN29R1uEtkiI75q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_074044_754717_E2F21287 
X-CRM114-Status: GOOD (  17.31  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/5/26 13:10, Linus Walleij wrote:
> Enable the Timer Events Oriented (TEO) cpuidle governor in the ARM
> multi_v5 and multi_v7 defconfigs.
> 
> The upsides of the TEO governor are described in
> commit b26bf6ab716f27955e2a503ffca1691582127cbb
> "cpuidle: New timer events oriented governor for tickless systems"
> by Rafael.
> 
> We need to gain some traction for this governor.
> 
> Both defconfigs already enable CPU_IDLE and NO_HZ_IDLE. Selecting
> CPU_IDLE_GOV_TEO suppresses Kconfig's automatic menu selection, so TEO
> becomes the default governor on these tickless configurations.
> 
> Leave multi_v4t_defconfig unchanged. It uses periodic ticks, which
> select the ladder governor and give it a higher runtime rating than
> TEO. Enabling TEO alone would not make it the default.
> 
> Configuration generation was checked for both patches. No hardware
> runtime testing was performed.
> 
> Prepared with OpenAI Codex assistance.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>



