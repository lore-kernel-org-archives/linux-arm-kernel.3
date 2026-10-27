Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBE5606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 13:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PHQXo3+E;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=jh12NxsD;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d0i6sBX9;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MwI+Sn0A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UapQjdPeDJO9VRKD4DDhYTxpcbEq19L9L6WakZY6BIU=; b=PHQXo3+E2+/cDA
	uetG8fTKl/kdcVQ9XK2lQ6VeRTjIEOKw+8dyn8ir7cLtN+ehSJLagV866wyatKF5DyzGzbJcDcEMt
	Va+fpn1ozTutszM3nsYGjBccY0ltv3IK1g0icsiKAGz9+k/zG7pArP/DUo5OeWcTveJYJDvHHSazM
	8DTawnYolAd0HRcoqKJ+M+lhpeUFP3BPUDriIcDjeBz+Mo6pVV6YHrQkQD8wRTo9YItmmb7YXJQ5V
	ZNOg44qQ9ljrZrpXBrklWCjY+Tk6yFqpxG/bn1xkQApEmpO6JAPPiESXU1J/yTGi4tzrD+FJmhE7O
	x3HE1Vcpr/93id7/GoMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgyl-00000004ktB-3NAa;
	Tue, 27 Oct 2026 13:12:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgyj-00000004ksT-45b6
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 27 Oct 2026 13:12:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UapQjdPeDJO9VRKD4DDhYTxpcbEq19L9L6WakZY6BIU=; b=jh12NxsDTJJHEux7TqYvmF+ocT
	XGpbN2AcVLOOitrTCOx1jt7T+ro7jI1r9PICSv4MgzG7LwhYwTpBJ9B3irCdOsSVWqxf6G733KeT/
	o+Rvgj0ZCs8OQR8eCNPr65uYb0SDY4ryOCs+uSKKaNsPADlH4wsKT3BaCE9BJPMrmAckG3yI9xWdM
	LIqvqOlLbPgE+4y2VQtJm9i1sHy2AmqdEY88UoPZ5aGjvcQMpyXT6xlUeCS1X8/dSlsJmLGEIrbC3
	d3tjNgadAdveVEVNQflsZplOKluVwSEkQMtUuI8+ADXuEOtbd8j4yTjbVfJcIyUxcYhvPYpuLbYPB
	/UnKS5Vg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgyg-0000000EzjY-1lsK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 13:12:36 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe2851973857
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 13:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UapQjdPeDJO9VRKD4DDhYTxpcbEq19L9L6WakZY6BIU=; b=d0i6sBX94Z5GJjN+
	2clrqpaZZ7pFbAJQv+7lWo2nSHGqPVYiQlDEho073CkcRpPw9bdHwvp9GzRYLtVi
	LHoXA1E0KX191jlWuNU3clKwM1s8GSCj/0KrC3sin4lRnMg2ZBvUULT3azjVPLXD
	vl6SXZHU9lDtTsU+4Kxc1yaEB5KFYEWzbT8BvgexbhzqP1oP1qlaAs9Vu+I4VyOU
	0KZ/nYyBoexKxMNakYR2K34ZA3pk8ksn2KXqrPZaohBG7HSjgUGW1jXFHt1Eb44v
	icRpKvhrdWYKiE0ZrJsMTYSYW0eHb+mCRkeMv2w7xRr7cVjUwMHsYkHhniqbKULi
	SdKubA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1gq1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 13:12:14 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso7318457eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 06:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793106734; x=1793711534; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UapQjdPeDJO9VRKD4DDhYTxpcbEq19L9L6WakZY6BIU=;
        b=MwI+Sn0AInyIaz9niV4ww3jDEIdizzpCrOHvys8Kzg56YIrI7NXDnNNP6Gnb7FFMy/
         WZ3NJApPById3j2lgGqhLS2+0OnKIRt62qCwTjDKMaQFf5BCSrna6FHHqy5wIAaIhKNM
         QLm4CDHoe0Ki3QN+lMvEPkUtsC60pP1pTvzfHdQn6FqWaSdL81Gievy1v2KcQrJcf797
         xQDreqtOujbB6zJi/xfcNACM1k0/CykIixFXU6VUEeNHA0IAU0WMT7nxUVNwNHuQalYB
         2gu35ELnOs9IoOpA0x8XoTwozGLqm5Op6oYCnqa1o294XyvdZzLkZ8liDKegGUtveqhN
         S/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793106734; x=1793711534;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UapQjdPeDJO9VRKD4DDhYTxpcbEq19L9L6WakZY6BIU=;
        b=zS2sb+VTOdcyYdtaRo0FABwdMoPWDrOmi/XDxVyeVmQerVDHN7vchZHQhnvXcnEMhr
         fu36OSNeTFCGvuYV1kGgL1+rpWmUA/BN/uMoX7pa/1SkiSt86uNsMpkAbljLpXcUQ3GI
         Yy7y8EUyNb6WRfxNE8ASrrm94weLz8dKPFlnigyxCDGd5zb0mi3eF8Q+M+rlpz2+kr3D
         CnEXh4bhqhD1horhVwU72aciDGaCU6NEEyaCQ7tZ8D/0rA52putWYiLtg8cN/HRe5iyN
         VslmYeC1lSxd2E0twug3KSK7yzIuo026J6n/PciH+woekPeR1FLvy11InpubRxzNPXam
         J3Ww==
X-Forwarded-Encrypted: i=1; AKwUvBx8sqJ2X7gEGIgufWyrDXzdZo2imLjo9mY5IpGvTz+WhSsYr33+JvhjXq5yuNjecty0OJtKSFM/rrcXFYG8CGbl@lists.infradead.org
X-Gm-Message-State: AFq9FYImTrTMAkw/a3u94eQhX7j5wHEnoicJjCj+yr08wOUXKS2NobHj
	QcXQgUTRMoIAJbR11qG4K1qbGktsXy7g2hDl9/JkoY0BN1sAtsHGJNPY6CCBFvPX+fSuUhBPCP+
	MXjNeJLXrljEg6K+GO9rv+AmmqGezC0tNN2PFYKk3dXiNWt4HeVf3KP0XHbtOqMkzeeX9ce761c
	lNNw==
X-Gm-Gg: AYBFou0IRX8oDhgraR8DWObNR43vGDmOzrsykkn4zH0gjELjjNgsNi4GZNnH9MhDfhO
	K292TupfWR7V06LYHDW7ebih0Yn527D96p/yuf1axu+XL13CJjJrtawBMZjJHWQeDGFwRh9pE9z
	A4rn31H6pvcJGnykdxfo3wrx38lyvQmZqfV1BNMKtci8nhWlgs/osD1sR95oSxj/7z8S1ug7wV9
	47QMSQqro3fF8AFU4k0Cl4j+bDnsCVXV3KGTK0E1VpC2ysUM8DEqTNmcV4Yfj4EQTF6dF9LYbgW
	L9SVqerrrCwooMNXyIIbI5CyYH6+/Zaw74iA8thWQ4Sye/Ointss8zaGCVEgAcd/Dwcd08Mqm0v
	9yFEtlSpNRrMbV+oD2jcdxWHgYA==
X-Received: by 2002:a05:693c:2807:b0:369:eec1:1d7e with SMTP id 5a478bee46e88-369eec12196mr12973442eec.11.1793106733517;
        Tue, 27 Oct 2026 06:12:13 -0700 (PDT)
X-Received: by 2002:a05:693c:2807:b0:369:eec1:1d7e with SMTP id 5a478bee46e88-369eec12196mr12973405eec.11.1793106732892;
        Tue, 27 Oct 2026 06:12:12 -0700 (PDT)
Received: from [10.218.2.197] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a14383b02sm7325798eec.14.2026.10.27.06.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 06:12:12 -0700 (PDT)
Message-ID: <e2147521-c736-4cfa-b482-e534a2a11a72@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:42:04 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] arm64: dts: qcom: sm6375: Do not mark MPM as a
 power domain provider
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-6-ac7f1a0d5638@oss.qualcomm.com>
 <5ad62m2ix47ynkq2ikghkxdqpcyv2tjixtojdobpjpdwbkkab6@gjklpaosvpk7>
 <114418ab-dab6-4772-994e-5babeed72b65@oss.qualcomm.com>
 <junlahp3txwwj2bs6pi3lhlvidxcp3zgvszb74xbciv4n4ymvo@tfyhqi6tr7mz>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <junlahp3txwwj2bs6pi3lhlvidxcp3zgvszb74xbciv4n4ymvo@tfyhqi6tr7mz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae0a32e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=hn2XikViVj-BPx_B1YEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: Yg1WMg8lP618TWoon-6dsCviD1-uvwUm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MiBTYWx0ZWRfXwrHrpJ70PKiW
 /tTgWEpGDDomWiIvqbNHLTcFGrVOMOTwOpez8NXoaH46XsllV9cWQsbR2Bq+sgTPJgAq+VocNeG
 ft9R96wIo+q4lrG/e7z68Z66hD3NBCg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MiBTYWx0ZWRfX+ssJqmcT4E/4
 7PoOytMdk9J9UTsAZTqEWy0SDDs1w/AIREbz434srkwZZnhdSD7DGfu+ZdjAkYPa6QJ0TyBMC+n
 INH3i3f3wJO2E1UzeiDAHyNXF0bkvZGkbq44y19xw8H8DgJztNitYGpNN819DpDY5rtlOmTcJaT
 9fE4bNicHV5QkipKWDSXaaKcaUuRMfRU1rrA5GgygbtnYQxVFYHXlMBc/CdiB1eiVgOZckOsokP
 6SUEgJSJa+B+FF3+m7yPb8mf2x1AnvvZbYvlhLMFzNKR6UAKHP0Mx06wWjhjXIGyRShX/6+LagK
 K+zj6U21TpC0d30YgApooOdIKDY8MnFVCm8PjZsgY5gbvYZ59Eb7ien5emOnSCcju1aV+7wrchX
 VuCpQ2+3+lTmdYZGminyNZJIAGneFLsGw4+ZwuXMnlo+8c6RtRKaS9rKm3uZG3kNiLDOFIJh0VH
 0QhCCTEVQng9g0TThnQ==
X-Proofpoint-GUID: Yg1WMg8lP618TWoon-6dsCviD1-uvwUm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_131235_169174_18EF56C6 
X-CRM114-Status: GOOD (  14.83  )
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
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 27-10-2026 16:29, Abel Vesa wrote:
> On 26-10-27 11:23:25, Sneh Mankad wrote:
>> On 20-10-2026 18:30, Abel Vesa wrote:
>>> On 26-10-15 15:25:22, Sneh Mankad wrote:
>>>> To make the MPM design more logical and avoid probe dependencies, the RPM
>>>> notification is managed by registering for CPU_PM notifications.
>>>>
>>>> Remove #power-domain-cells property from MPM device.
>>>
>>> Can you elaborate a bit on how the two phrases above are related?
>>
>> The MPM driver now supports two ways to handle sending the RPM notification,
>> either in the genPD's power_off callback as power domain provider, or within
>> the CPU_PM notification framework. Removing #power-domain-cells instructs MPM
>> driver to follow the latter path, which as explained in cover letter would
>> help avoid probe dependencies.
> 
> This should go into commit message, I think.

Sure will include that in commit description.

Thanks,
Sneh


