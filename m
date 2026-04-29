Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7769FFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1HoqX/um7TvyRf00b34e6if2JtOYQBSeAXkisbuBWI=; b=38NW9ja557xmV7BnHDp65lGNjR
	0yT2FOVnGBLT63MxuBcR4rIwP6qq+yvxIK3emEWwbcl/Z6boCzZbUuR0Ph4Bs6tcjXSAOwd80KKFv
	rzI5MHJutYhArJpwqQB++ZibZpo7D6upAJ9OT1hKJFRmF1qfg5K82t5Yywuh+DlQYTyRX77BVte2W
	AgV0EnzCeQV6e9Gi2UnbqrDJYaIA2cK4reXISJqz6juv3CkiozhohOIEAoHe31GURBD7df1EKHREn
	/91K/jCrtZBR5d+Gb/tmPDeHBiVGPeji0qAI0tlWlwLGdLb+1uheREJOuZLl1OelycdEBQ96TH3NM
	yLT8CoWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1Up-00000003NgQ-13o1;
	Wed, 29 Apr 2026 09:46:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1Un-00000003Nfm-3Pbx
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Apr 2026 09:46:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=a1HoqX/um7TvyRf00b34e6if2JtOYQBSeAXkisbuBWI=; b=Dsg3OOvNM5FG+KSck5Fc9KQgs1
	zyVu0mmAljzx+9bE4QCUvNlSNGM+8tAJq/puyZ1dK3rJ+8aPPNqw9wUCRAgApRTUDF2Z7kPd6kRRH
	vZ/NYpDs6VDsPL0UWxQ6d3XRF2OB59fyKEb0VE5DhXafMLR9gSqRf6GCrEkXSuAWzEqHJQ1depf3F
	5jq895JACVz1l/G1S5RL1nPVjm4MfMXPsjMNGk+y4CcsgiOrSZoWNESTgMJtBRaiMesUdKxBDrbO1
	yLXb7dtDl4JLy55WaJzuB16IIoFPrBhs93vv6/LVS86e/jAPctMmzThdMAjq9YA9v54zi3qJgibnq
	spSmUNPw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1Uj-000000051D9-0Ra4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 09:46:16 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qbxm870107
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 09:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a1HoqX/um7TvyRf00b34e6if2JtOYQBSeAXkisbuBWI=; b=ZyX8jVoEdRgS5TlB
	r5nhfjnzKPoIgUnZoDE3jUhpJaimuW3ucvLLLImDe4hbF6uO3n9uAFgT/Dd9RijC
	wa758TyTD1u96L3Xqd9iSGGAO2/WTnpt1+H2KtKwO5Hbv6aUJfAwOF0uUrCDYSem
	FfFEp7pWDKCPwA/pu6qm1ZKzklwgM3JCo/vw3EMi7BHolnfgYHMZdNO0aORu8wGb
	9Fvbttejukt71+AZlSryv5wHZ0EFtyDx514P4Bu07E05nO5wtKQD/1w88H3OMbkr
	WUFM0BRNjdPnZWLFn6RyP0lM2FCks4NQQN2vuytzLTBSH8XyTAXc5J8sfZxxqGvE
	EmvQ4w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0u1u9gr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 09:46:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a90510a6d1so5453715ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 02:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777455968; x=1778060768; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a1HoqX/um7TvyRf00b34e6if2JtOYQBSeAXkisbuBWI=;
        b=d5wD5FMokSjp2kZSgksohEFpsEReps8kqm+Qdwf5/9l1hQ8+StMSEsRkJHco9bLq93
         FbwIHhM8yhpk2wiDLEu773Yo1Y/ZK3yW30r3bPQuysc/LVonPVfn3ouZhy3tjaXWDm1Z
         C++gA7CBzNZ7Er7fQ/AZrBM0uJAZMFg4Fjz6tzbN1VMoa0URN2NyUCN+vUHujm6d3nNK
         4nb7LzXT30RThaWkjraP+13uJ/7Agn7sfBCkEyGm20zFhFwwkumJUqbrLcexdwArOrys
         TkJbOEsJWRpC3HROYWPb3DUQz+PuU8sF/icZvpuwTHhuYZtoH3ooGQz3IdYygAZkkS7f
         92iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777455968; x=1778060768;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a1HoqX/um7TvyRf00b34e6if2JtOYQBSeAXkisbuBWI=;
        b=lN/SoMDel64+qEa1qMVEksWFKw7WRVi+iD21F33S255aPVEBy11uO+6WphUdHXL4o2
         hWoBepZDqsUKDT4QWypHAF4Fj75iRbAubAvJ/+DUKAKEf8zap9cX35ulZk13aBz6YQea
         5G8T6ScLZY1E27ugY0H1hMMsUgbfSN2ZkaGfobhLgXZLWj5cnGNTKfjy1EhBKvIF0BDT
         /WCAPQw4R70m8rHvSs38WXUWidL7ONT/8eYJzbkOOg+AUOOovOq1nyKg97FT/tuaNtaj
         qAPn2A8xSVLj31T/BURI2S8jMj9+M7VdubJpN+UqZWkydFwUsfmo3SSajrTa7TVne+PY
         raGw==
X-Forwarded-Encrypted: i=1; AFNElJ8oDP+fxd5oHKhT/TuSZz6F/K1lDd+j1VnnxlCGu6sj6oycEdsNbBnr73holZJXPoKnaSkDkn9LTO6E50oU++HA@lists.infradead.org
X-Gm-Message-State: AOJu0Yzgt4xqH7++gMHHUFX4ff4LuO7lncxKScvTLpaOjn27PpwD62/b
	yBH7Txrl0jpsBg+PnxyluQYqt+BBYgk5A/iC53gxn5zxDfjVmnlX/QObgUl7LePOAj3KzCsTSPV
	l4nqfehBcnpt8au+YDdZbMoUWhOmDONM0ltl7SIqSr+TsHQjfYwpw4gIcWsXXUlaheO934zChB7
	hNpw==
X-Gm-Gg: AeBDieurxy5jF/YwXuW/+7xOY09p1kcnzoKBaMfJu+ZDIHCBucykSZZKMTep4SKdMyQ
	byuVgHB1gIvjmo8E3EmZZ5NVOYO2y3aYODIhDQ+UiVj/wZkydCzx5gVb0DpjtVYLcCVsmqvM8vX
	6eKnxCkarKPCpA2Qs21BV4OUkjTYiXjism6xwm9EkVsS6k91cRHBOd9kz4mj96vwt1P1IrHBrB5
	9rwtkx5MeOtHWv1lJFvv4WsL8K8RHZeAHA7yyROZczDu9sGhO0NglH9KJ+WRQGtxcN4OVVmLUQv
	lDgNRjDrbOgxAwDiCv6r8tzEc4+NHTa+o9iltd4CvecMFCQnrma0TGcAztmW6W1fyZFLIv6ezj5
	dEM9zomWvIZHKYzNW6JNI1h6HT8zJDzGUimQn7UASMhDjaKMoTnFR+DbG1LBipCmvAhM=
X-Received: by 2002:a17:902:e741:b0:2b2:5099:2f40 with SMTP id d9443c01a7336-2b98824f071mr20792685ad.22.1777455967935;
        Wed, 29 Apr 2026 02:46:07 -0700 (PDT)
X-Received: by 2002:a17:902:e741:b0:2b2:5099:2f40 with SMTP id d9443c01a7336-2b98824f071mr20792365ad.22.1777455967428;
        Wed, 29 Apr 2026 02:46:07 -0700 (PDT)
Received: from [10.219.57.134] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98897112bsm17629145ad.67.2026.04.29.02.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:46:07 -0700 (PDT)
Message-ID: <ce92a493-5016-41a2-8337-d2227cdf760a@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 15:15:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 08/13] mfd: core: Add firmware-node support to MFD
 cells
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Florian Fainelli
 <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-8-dcf937775e73@oss.qualcomm.com>
 <CAMRc=Mf+-04Zr7jjRoaxTzO3LKSMyQ7DzxJc=dHNSyThEUiq_Q@mail.gmail.com>
 <c0677503-8073-4940-8eb0-c06b34f843d2@oss.qualcomm.com>
 <CAMRc=MdxpSXiqAn-8Az4ig4N8TFVdE9psacPVG9J9KehuFnbwA@mail.gmail.com>
 <d6112b9c-01ea-483c-98fe-b480e78872e5@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d6112b9c-01ea-483c-98fe-b480e78872e5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OaZYZ5dfhgtvR1IcRyY82AAvxU5I4_Kn
X-Proofpoint-ORIG-GUID: OaZYZ5dfhgtvR1IcRyY82AAvxU5I4_Kn
X-Authority-Analysis: v=2.4 cv=aPPAb79m c=1 sm=1 tr=0 ts=69f1d360 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=44wx8BIOPdhe_q6X2V4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5OCBTYWx0ZWRfX6fzR+GGukHnG
 9yTJ5AbDPmYweicf/YS+nsEoyMhxy3NLTuq+4OCgNDhCvAgz1+YWi6HWfvLXWvKG+cNRJIihzU4
 MnOQOsF+TDWebxqI2YfwFv/XsosvRVaEyeFdONM5nojZHJNHIVcVBBfIpWnWM9r7ZCltRdsRiDm
 ILJBVLpdRQSta+DRqTqASiGKJVzTUI51LMuiCDfLzO8PzKRTbkCeEgnMA6HtyTUCJYawdVazZZi
 FASo5uRYBPbrsjaIxH9kYEPqdtHyg05YmDEkmUgoUfJE55+iZOemOMHPCZ7/bPfuN1h4BrPGlMK
 Yh3OEq+Uf6cpOjndasuQf1K/P0GepWddBAgZLpuxadlr1Tt5ZJ/+kHS2nckOXjbntUV2hKr8hzb
 m1iruTanTlrCHkM/aO/A9GPGmq9fulmmBycHsha4rP0A2ANSxggVucVcNWiE4WLLj906r8o6h2r
 1eOlvkQtczjDOWjtL6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_104613_877683_2FD42C77 
X-CRM114-Status: GOOD (  20.20  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 28-04-2026 18:33, Shivendra Pratap wrote:
> 
> 
> On 28-04-2026 18:21, Bartosz Golaszewski wrote:
>> On Tue, Apr 28, 2026 at 2:18 PM Shivendra Pratap
>> <shivendra.pratap@oss.qualcomm.com> wrote:
>>>
>>>
>>>
>>> On 28-04-2026 13:33, Bartosz Golaszewski wrote:
>>>> On Mon, 27 Apr 2026 19:34:48 +0200, Shivendra Pratap
>>>> <shivendra.pratap@oss.qualcomm.com> said:
>>>>> MFD core has no way to register a child device using an explicit 
>>>>> firmware
>>>>> node. This prevents drivers from registering child nodes when those 
>>>>> nodes
>>>>> do not define a compatible string. One such example is the PSCI
>>>>> "reboot-mode" node, which omits a compatible string as it describes
>>>>> boot-states provided by the underlying firmware.
>>>>>
>>>>> Extend struct mfd_cell with an optional fwnode pointer and attach 
>>>>> it to the
>>>>> child device during registration when no firmware node is already 
>>>>> assigned.
>>>>>
>>>>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> In the following patch you use this and violate the supposed 
>>>> constness of
>>>> MFD cells. This also mean you need to modify the mfd_cell at run- 
>>>> time. I would
>>>> prefer introducing a field in mfd_cell: bool use_parent_fwnode which 
>>>> would
>>>> indicate to MFD core that - in case no fwnode was assigned from 
>>>> other sources:
>>>> DT or software node - it should reuse the parent MFD device's node.
>>>
>>> Have one doubt on this, When we fallback to use_parent_fwnode for cell:
>>> psci-reboot-mode, at psci_reboot_mode_probe(), pDev->dev->of_node point
>>> to psci node.
>>>
>>> But we want dev->of_node to point to "reboot-mode" node. This may need
>>> an explicit assignment again of of_node?
>>>
>>
>> Ah, sorry you're right. I'd like to avoid having to modify the
>> mfd_cell entry at run-time if possible.
>>
>> How about a callback in mfd_cell like:
>>
>> struct fwnode_handle *(*get_fwnode)(struct device *parent);
>>
>> If set, it would be called from MFD core and would do the name lookup
>> and return the fwnode which would then be assigned to the cell device?
> 

Or should we just drop this patch for fwnode in mfd-core?

Export a new call in reboot-mode framework as:
reboot_mode_register_node(struct reboot_mode_driver *reboot, 
                   struct device_node *np / fwnode)

Use the parent node in psci-reboot-mode and find reboot-mode and call 
reboot_mode_register_node?

thanks,
Shivendra

> sure. thanks. We can make it a callback from MFD core.
> 
> thanks,
> Shivendra

