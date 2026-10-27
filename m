Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB30606A325
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 11:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FIJzSXxm;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UDKH5IxI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QmbV/ePW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9NnZK2sny34h7fHthZ2KAJ/JJ3o+yLef90wnW+xMkRE=; b=FIJzSXxmt6YScN
	C003ieobIpmlKZiJSTjXNrG1v+uVLlcJdgjFsPReivZi5UzWSmZ4+JeYKN0IBlEUKxzZGfQOKKe+6
	lzIJfFZzP1vZRNSCF7d2eO6zq8+uAS00pp8IOBialrRYHh2spDr2yrbvHJntbPEJ6WSTJfzNVcKY1
	+kb27097hABpS2uPI4W2iDY0GgUr0OYdCpsIbUqb3ORCr1jIHKJUq7qwCMtaElQK8u23i6NktVcdb
	foIxboahFPVRhraXTZn6+15XFIkDHZiDc0qcThOdQk04usffaWpPF0LxMDjR5SP9FoawXd1fy585s
	0/1FlBJE2ryyhokfAJ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfRQ-00000004USA-1U2S;
	Tue, 27 Oct 2026 11:34:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfRO-00000004URb-04Ml
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 11:34:07 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdxMw2523926
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 11:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9NnZK2sny34h7fHthZ2KAJ/JJ3o+yLef90wnW+xMkRE=; b=UDKH5IxIV0M1zIuK
	wfthDtrI33Q1APWL+XivnX0a4xs4ouEd0AFb5cAnlMA6Tl3Es/yAUKQX2EQ04j0h
	tl/9Xg5HqTRZDkT75hpX2dqoabff+OVq5TpTG4N1bzDuSdAdKBPd23y8oBsgsrM2
	tFBpiQIl94JxmVuII/2Iof+7fclT+/qrpM1sb0y4JGdIUJcliWuiEgYw5cuNjToD
	VJMQPQ77dk2Ozo/rNkCQ1u+R/jyGF5EFL/FmwZGEVRvE4Z7PW/uYb9qKAYoauQMO
	R/2Y6I+qJptUeWN1s1zvZMeNcVhnnn/gn1U39U54txoHHYV9qbRz2qgcJnB835kr
	VRsCTg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw20usr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 11:34:04 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso7279638eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 04:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100844; x=1793705644; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9NnZK2sny34h7fHthZ2KAJ/JJ3o+yLef90wnW+xMkRE=;
        b=QmbV/ePWrg2R7LVV7DHMlsVTRypakBt1IzNQfhND/G1fxipIAIy8cPOe07GgTOFMYX
         1G5JLI7RA4Wm7LwnruPvMoULd42PGnBGjLpeHI91Qv/8HqS+aV1ncL9Qmi/uxRoUut4Y
         CDJqdnR3vL4Xlqw8I2dYbiObbNukjQbI7NfvOxV53GxxjxqNCDlOLa94k9L9TWEc7+fx
         HDElUPQRgGngpwfleNVfJ9YXGDKeyWzX1ab5Nmq6j50GtRXdwR6Kfm6sVPYm1/059QvF
         uRT9KOjGrlu/FBRf7ep91mQ9vxXklpGeP4E3hjNuDDKxqv0vefb/aXi/ZXhFDywh7/W9
         0apA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100844; x=1793705644;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9NnZK2sny34h7fHthZ2KAJ/JJ3o+yLef90wnW+xMkRE=;
        b=pF+CzloT3TIjD3JInTLMkRFwZci0rnuYCo5yB2gv/cRPs8kM5qDs3wuWsmi0TEBfRe
         sM6+4zvBAZXM6aJ+itqFZDa9enpORA26c3JQpZQedwtt1t9rfOlVMVmbyQJBn/D0xMHL
         8AZOROMAYJivlkqHWF7Xhp9Sr7wWrKFOgxqE3I5mgCTetEvNoNAVYasAQY/Lycvtcf14
         0zzCcl62vdwN4obkKzRDtqCYg9x2Bv/Uji8HOaGF/cEqlC96VyGW3equF8wpLehAlcGV
         4jgHoa0SvTnnHDqWkMx1OKbuOTVD20WD/BF2K6ataIP4PxiTdVuR9bxDPx3dYMRNOD9P
         rxRw==
X-Forwarded-Encrypted: i=1; AKwUvBwXvWpIGDyqnuyGjLeotpYe8w3+ARZrBkHnsGFcVH1cIc/FUxEdCejh0K5ZKj2p/J4YLYXCmVmpEseva9sr1bSt@lists.infradead.org
X-Gm-Message-State: AFq9FYLAjz0Rj4UDVHXIanajuVmveKFW4dCN81jytaLcfqLBUY1KZDju
	b2Mt+RThBenR/k7g68DDIrExtGCwj0FOTCckwwor66lwaRTjXGt2cQVuJ/uJ7LYr00idoI3DULS
	VxbRg/1wwQY5qU/7Xpmpvwn9+SniumRMnJ9mez1C2jcduwVAS2WNQgn/MACkL6NM+tDpQ9OUZtr
	3pAw==
X-Gm-Gg: AYBFou0ZjwNbvAYHUYO6Ui+QLeVEmHXH8VltEm28SdbyHtJyHQ3pKoh4rj9IsA5whyq
	hPz0BDXBYMMnp4e2Pthholb6eZkkvnYX2gxFx9ZW+qf/tx4P48RYsUHHrMi/LzYCcPPtRbpa+c2
	a5dOX77c5YhGhWDz1DoUTrWp1QV1Qu9nO0l9uZ4/n1mIleniw9c0JDSwySLX3JlBpjm+E9MCOXX
	5hNSb0JhSZvaVfOZwZNhV4Fu2q4B/cdvG5O2tUqTNt5mNsmCVL30u8IKb0teACp0WesOS10t5Jl
	pU2TlY8/YzNcpn3pqXcNH/0Mxhv2knZmHgE/hVJ5jdLr/Vv2wtUYrjkHnO/+Ji6ToLeaMQMKm+6
	AKCAIulwqjabbRSmLD0DaMP5YPQ==
X-Received: by 2002:a05:693c:2d86:b0:369:44b3:99c0 with SMTP id 5a478bee46e88-369e847b24fmr20368353eec.8.1793100843588;
        Tue, 27 Oct 2026 04:34:03 -0700 (PDT)
X-Received: by 2002:a05:693c:2d86:b0:369:44b3:99c0 with SMTP id 5a478bee46e88-369e847b24fmr20368294eec.8.1793100842969;
        Tue, 27 Oct 2026 04:34:02 -0700 (PDT)
Received: from [10.218.2.197] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a064510b0sm17653416eec.2.2026.10.27.04.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:34:02 -0700 (PDT)
Message-ID: <3a1f6a65-4406-484b-a2cd-00019149d4a1@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 17:03:55 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] irqchip/irq-qcom-mpm: Program wakeup timer when
 CPU cluster goes to LPM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-5-ac7f1a0d5638@oss.qualcomm.com>
 <b833f6f9-5729-4936-8c5b-cd42d32c5198@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <b833f6f9-5729-4936-8c5b-cd42d32c5198@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX9+eVvW3qLP0/
 mAAIn4+yTMHCziPty9sLOrjfShk+7D2m5/Z59rfOG5qNR5XxIe3sR2ishXzLnLUsSN26hNAGDe4
 MOL+rFJZR+KhhFxdH05xxJIqlEPralkfmqK2AskAKdaMxlzMOuKCh0b7bSBWqeHlIl9mdzSiwNI
 UJnXLYof+GHi3mBWBgc84WVDn5ZnN714qcHffi5p9CfNw3CPkKlD9/I7JIEK0U7jWPauZ5NUW96
 z5HBkEan2dhGj2lYuvuhbE2oDJX66EQmWMeOCZF9F5YV/2Ala3SH9q/hHtmhVGdAPCBojsvvL1G
 Jv4DX2luACEdpX4o88eDh85wCbB4R842ID8/dgFk8y2t41z9UJbqNY3Tt3AOlxRMZwNG3nC9Fkz
 eoNv66/7ZBmSdBFTfKBIufkZc1JQczkRmOLcE8Yvg/iXcwZAlIg5C06UuadNSv58zVDULGu10SJ
 u8DqF0skmLtEK9mX+yQ==
X-Proofpoint-GUID: iP23fy_RzYgKKx0YmVrfUgjWdqg9YdIM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX3Bv7kADB5ayw
 w6AnZ0mXlqT9KuAhitDcMDwW5mbsFz+Wusu6JXAbumREH3Ruk8d/uOQwWPSyGj3coF7bHR8rCcJ
 a/++13ySQVNMcdo7YnNBEXqU4eoxZRA=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae08c2c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=vCH4AkwshzAlar4tAyUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: iP23fy_RzYgKKx0YmVrfUgjWdqg9YdIM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_043406_196694_95D7A15C 
X-CRM114-Status: GOOD (  18.86  )
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



On 19-10-2026 17:26, Konrad Dybcio wrote:
> On 10/15/26 11:55 AM, Sneh Mankad wrote:
>> The next wakeup timer value needs to be set in MPM timer as the arch timer
>> interrupt can not wakeup the SoC if after the deepest CPUidle states the
>> SoC also enters deepest low power state.
>>
>> To wakeup the SoC in such scenarios the earliest wakeup time is set in MPM
>> timer and the Resource Power Manager (RPM processor) takes care of setting
>> the timer in HW.
>>
>> Add MPM timer programming when CPU cluster enters power collapse.
>>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static void mpm_write_next_wakeup(struct qcom_mpm_priv *priv)
>> +{
>> +	ktime_t now, wakeup = KTIME_MAX;
>> +	u64 wakeup_us, wakeup_cycles = ~0;
>> +	u32 lo, hi;
>> +
>> +	/* Set highest time when system (timekeeping) is suspended */
>> +	if (system_state == SYSTEM_SUSPEND)
>> +		goto exit;
>> +
>> +	/* Find the relative wakeup in kernel time scale */
>> +	wakeup = dev_pm_genpd_get_next_hrtimer(priv->dev);
> 
> This returns KTIME_MAX after the DT patches in this series are merged
> (because there's no power_domain that the MPM hangs off of anymore)

Yes that is true, thanks for pointing out. Perhaps we will revisit the timer changes
once we manage to add MPM device under CPU cluster power domain without blocking cluster
LPMs. For now will drop them from revised series.

Thanks,
Sneh


