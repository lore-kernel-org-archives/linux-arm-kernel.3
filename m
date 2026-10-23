Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4378C606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 12:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DyMk7ajg;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h5L59kEI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bvcCZ82r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2v7sykkVpQFD15T/qtMC8NWAztz/dUgETy0RLYu2jp8=; b=DyMk7ajg43Q6A8
	tJzu4HDc5ZBo0hQiFEHCsyoEuAY9cJZ2ceWJEOrxUnhSMgwqy/bsRdHC6PmI15TBOw/uOeOGuGPxJ
	0dZ8qrB1K6tpkqaD4EKsVoAkTJ8TlV7GGg5ZlgE3tUn8F4g/Oh4AgV7Cz2IzEYS66+qeV8xJXzZ1Q
	2e3M/WH7euSIzMsmP2GREMYwPeP68uwEW8dlDxx1Xf/4WJfOlksQSJhW3cPF4Hu5k+SJZnrsFKzKM
	MTF3fq9IxRrvxaGmGq58OBv25W7S/ilCYWbHRatGJtHUcmaNq2mUR+hVl7px7MTbGcxtdoLTQte9V
	XL4ZV4jdu09gNbBARMew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKE0E-0000000GGgO-2p6S;
	Fri, 23 Oct 2026 12:04:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKE0D-0000000GGg2-03Sf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 12:04:06 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAATQZ3550579
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 12:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2v7sykkVpQFD15T/qtMC8NWAztz/dUgETy0RLYu2jp8=; b=h5L59kEIQ/3LwFB7
	bNnjdoQed4rRZlG/2nqyWogTvOgQxtmgAFJWoqOGMfgv9Oy2q0L95WZEbPm8CXF6
	gUMwudisky+BO/d/5ARtn9Jt9QpzA9om1ylWvq+SVUHrVF6AWt4uBQ52XhFiALFp
	wisDT7HfLyTQ3wNQHoDSWClIKU8+Zo0wj5fzPJ3ZAfE/VWmELr38uEAClRXF80So
	nPLbPNxiogVq1qvif5iEw2AcvBST8tZQaj5NK4ojlcFJEmEYtUeQIhu+4PXxnYvM
	k7A2AB2gWgZ0cezr9xp8x/YuKn+hmuwotIrTE79J53YP9qX//rK5SvvHBeCK41m5
	z8Y24A==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmrbhx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 12:04:04 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-988b530df14so12748241.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 05:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792757043; x=1793361843; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2v7sykkVpQFD15T/qtMC8NWAztz/dUgETy0RLYu2jp8=;
        b=bvcCZ82rp2NtGRagSKs8WBJ1FuVmNbs9Smf/GyHKJzgFKEFnkSUVWMabVm1q0mFxmk
         9B7copRsc8j+WZ/7B/jT2BsQRkwqdXVTE153jzMtvY59TiTLKXo8YPUw2u/40wBgi9vE
         bg5T8mGdTOjPqUQ2+Dug1bOdC668anfwufJGCjtTfXEyK1RnX204IgFIwV3o009/X+VM
         tElEvbenktRZwUI03tfZWMfOSL7f16OCeNXpKG5+YRUaJ8ouPjgCa9z/7hxmwbFVs+dK
         s3uCbbeCDdWYvUn/+kLloOfIX88NziaFXS4oCa912InVu0pk/zUfW7Ymhb7WNlfFcrct
         knQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792757043; x=1793361843;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2v7sykkVpQFD15T/qtMC8NWAztz/dUgETy0RLYu2jp8=;
        b=C5xFKsekcV/F/oo3scsgUYS7+1BoudUnYxHxJFhn4NMelYZRRjGm0dpPKk8ARwSSuq
         6Moqieexz4c7RnL04CdK7dvTQh2R4o31ZI1Cc+rJkr+7w449s9HqTOdydL0F4SbjVsHS
         A95aHoZsMk5v9SFl59ElFS87Z6jmG26ZDh6VmZ9KtiGPjRXHV+kAdjpsqv+Um4g26OcS
         I2sY1LVZWDuokWftxwrqylNUNkV0zbq31sqA3jb0tO1AQOPfV2SiH4YqwCjLW3vVgMs4
         ilBdZYiq6idi+bfzcwN5UK1d3kKhV7y71ZKaRaRBEkjaxSSvjlCcqlUdRoRQm4DELd+X
         2h9g==
X-Forwarded-Encrypted: i=1; AKwUvBxEjuzdrvTMwcjboxP5pMU54VRgKR7ebNsRp6RyGt3fIz5hh9pkfOZAeJtVNSOW6Xwiyoh6QF4sGbl3u6ZptHCm@lists.infradead.org
X-Gm-Message-State: AFq9FYJqoTQe7cMZJN+wmc3KDe/RX09tM7Po27kF4At7BDuwf0GnUENC
	P83xcevoeK/SqGFcZw/J4UJTI98gJYRLGcLjUAuG0EEfKLrxPm9NxsI6oqZ/HZQux/d+l7mhvXg
	VR9JLIuQHskcWGm0HINUI6j2ZhZ6IHhDZL1Oxd10Uqe0tKavBk9BSyxmrkyD2Qko2cQbQjpHtrM
	O4gw==
X-Gm-Gg: AYBFou0XAd0HigX8JGGYhvCQQSu8/FE8ZTf2HXwpnB3PbFcHwoGnKpISLufs2Ola15y
	JnYkMer7XuTY+0IP5zBFXRJkikqb0D01YdQsMXuWUupYlN97j4WKN+dmxjnyApJyfFl5IRhe7Xr
	tt00I1umoHYOntP+1LCTF4+IPJ6CoNr9JYMa/PXxBPOz1NEhpl3R5yVnvYY2jX9xK2of9obyUlV
	VltWhYmdxcifLLr0V2UAfuYckUua2cJ0SLZZhpOkCXDMbHOD+SBZvAfFTXNW9OZYBiQC21mk7PD
	tKD6zqKP/W2wEFqeAsPLlKbPBrdNL9V6NQ7AkGD9N9H0t60OsQrKojXJPcMUa3GF+NSLxMNc73A
	x1bcwI+nMPy82DvvY7eOQJA==
X-Received: by 2002:a05:6102:8515:20b0:7cc:174b:f7b7 with SMTP id ada2fe7eead31-7ccc2d8f97emr718408137.0.1792757043119;
        Fri, 23 Oct 2026 05:04:03 -0700 (PDT)
X-Received: by 2002:a05:6102:8515:20b0:7cc:174b:f7b7 with SMTP id ada2fe7eead31-7ccc2d8f97emr718339137.0.1792757042539;
        Fri, 23 Oct 2026 05:04:02 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b432c96badsm977598a12.14.2026.10.23.05.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 05:04:01 -0700 (PDT)
Message-ID: <1feb10d8-75f3-4dbf-9fae-807dc5a22c25@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 14:03:57 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM v3 8/8] arm64: dts: qcom: kaanapali: Add MPAM MSC
 nodes for the L2 caches
To: Yin Li <yin.li@oss.qualcomm.com>, Ben Horgan <ben.horgan@arm.com>,
        Rob Herring <robh@kernel.org>
Cc: James Morse <james.morse@arm.com>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-8-35196c2b43bf@oss.qualcomm.com>
 <20261008210004.GA1318789-robh@kernel.org>
 <1d764a3d-7935-4e26-b1c2-92537e1d3811@oss.qualcomm.com>
 <893507ca-b956-474c-9124-92fbfc25e9ab@arm.com>
 <f17e31ca-817c-4607-a680-55ceb12169dc@oss.qualcomm.com>
 <6e06228b-827a-4321-99c1-3e0e961abd61@arm.com>
 <86fee017-c9cb-4583-beab-4f29919fb518@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <86fee017-c9cb-4583-beab-4f29919fb518@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VJMFOZLQJLkRVkioGV5oNVEf9Wo98Tr_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfX3SBJnU9teKX9
 DfdbuzaqS8ZViAB16puATk69odT2Z/WRIF5t4KBSfQLY3ElsuKhgyv2dVC0Y5SrUepJYXphemy5
 +KAPumQmh03SNJZPXJtl/VcXQnxVBB8=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb4d34 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=u5pNeYj4kXT91oPWfH4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfX41Et0C/s4IZf
 k7J+PszE7ZUOeKfbDZktT1ytz2EndpxX31O+gfMJZiSVGFSJnXWHRa9fn5O2iN2ej4b/WzUv+3H
 x4X8xbEuzy6T07ulE5lHhgUZ12oG7J1eIBGj2Z7v8JQTKXFUNjkKxtTl2RO3DcRiLmp3PFWyGd3
 9H9FHTR0bjKzcVsw/KW036k0hD7oKd4bOhqy7DIzyhUeVwqKc66nHaBMQfLt0fkaqAOWxOBYyR6
 w+hTbpxbEdcsOzRyPi2SW2U5CU+D6FNc777NpOYXqJLvLghHkeGSlhIDYF7tXA5B96rS6ieszfy
 a3yrxSDSsU2JENuzIEjbst0WcCm9BxdVBPUONpjeiQAUwXSNt2A5izEM28c6iNYBBTxBuxILwIP
 +a04ULyguy2G73DyXMtstW6aRuymyPPETzRFaei74QKfQCmOifpR3+Gh9m9C2YMrrYfBEiyLS9A
 RrBuLi9rFNB1x0OTFUg==
X-Proofpoint-ORIG-GUID: VJMFOZLQJLkRVkioGV5oNVEf9Wo98Tr_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_050405_073667_85B59F28 
X-CRM114-Status: GOOD (  15.97  )
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
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/14/26 9:09 AM, Yin Li wrote:
> 
> 
> On 10/13/2026 6:37 PM, Ben Horgan wrote:
>> Hi Yin,

[...]

> Hi Ben, Konrad,
> 
> The original 0x10000 reflects the per-MSC register block size as
> allocated in the KNP hardware — as Konrad noted, Qualcomm DTs tend to
> use "how much register space is allocated for this block" rather than
> "what the last used register ends" to avoid holes.
> 
> We'd like to update it to 0x321c to give other platform authors a more useful reference, without exposing KNP-internal details such as address holes between blocks. In our case, we don't implement MPAMCFG_MBW_PBM, and — as you noted — the registers from 0x3000 onward are domain-specific; since we have no domains, those aren't used either. So the actual footprint we need is smaller than 0x321c, but showing the full 0x321c gives other authors a complete picture of the allocated register space.
> 
> That said, this patch is marked DNM and is intended as a local
> verification example only, not for merging.

If you don't intend it to get merged, you can even put 0x12345
in there. But for future submissions that will have the intent to
be merged, please stick to the 0x10000 size

Konrad

