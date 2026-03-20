Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF493108B8E8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 10:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j0DtKeMa4Pd2GvQ/CpXa+k2INvnblUOKZ0/9dT+1/Co=; b=K6oMpIywu5RVXyYs2GvduwB+/d
	HC6DdhYrZHp9Y+dUgBmI9QDuUF9cgSpBOoVekfqFU/tpYocy08CWpfiazOPGDnwa39ZJSeX1X+GJh
	uLd3+wA7K7wnP4WEjAo5013XMACw2/yUOJnaVrx9SAp2SN1YeBrIOvUe9ukgYvteRw1VmbdSGuYV2
	pvAITiq7x4nvrYjqPkPTwYzQs89vjD9RMOPqeim/pFtDCrWfy6Ala2Od9oF1FJfKGmehnq4srZS2R
	KjCbP4IwQ8cIquYwfrPTtnFfq0BCxhSSgxurmQyv9wp4iJ/BPMBmmJj+o8OPYtX55teSDHtor08qg
	R1aGzPFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Wmp-0000000CYKd-0TL5;
	Fri, 20 Mar 2026 10:08:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Wmn-0000000CYKL-2JUo
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 10:08:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=j0DtKeMa4Pd2GvQ/CpXa+k2INvnblUOKZ0/9dT+1/Co=; b=UplXdX27l8hx8ufh2Cq4lJRfUQ
	tdCmXS3Er47G9sSMIuqX6RriC8h1q9dKHd/02tkhU9UYdnPvdO2e2iIQqVaUiNL/r2JEPh7c2U1So
	DfMbmHiNxi30RrmaKzJJZ4v/p6kiu+EyYAy7SHAszO6CDw9H1SZmBxJdj6hrRmgDhJ043CyC+ch/Z
	SV4IX1UUHVJsmDqPixRbFfFYC6QJxwTchHoXmXIPkiXtM5Ew4eddwi3J0pbCp4rlL3krsNtGLBZFw
	1EYbOA7upPA89iT73NB5niUvtnkqMgkp04muuGA+AZlkpnNeLdERE3OfxvcwpQI8NYduZXRjBZNvu
	jNBgS4hQ==;
Received: from mail-japaneastazon11023131.outbound.protection.outlook.com ([52.101.127.131] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WmZ-0000000FIJp-1RLd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 10:08:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VtdOC124/vT2qEnNFPtUkCs9uwWD5S5wapOzSoC8BIABarjjHOTvjTz6X7m22LLc88y68EIHAb5pXQt/LNGHR7A3wcBeKGW7mPBIxDI1C/565sJ8xPwmXKzNkyT2qoRe4Q1tLJ0LMJ8UmqbBMQ+NXI9+G6wYpdIMwBaDTBY/It46ogFmjhX5G6mGbfh8JeIxomQZjEQq+IhU98eyjOKXit+R9IHDgSwdSxxrPlPo+rWRf3AtZX41KYGjnzANgit7/SHelDlMm8bQbOsq+d38kf2mBsG9r7ecbgWluCBTnBjJCKhPWByvrTZcIS2NhyI/aXTjkqv1O69w6s0fE/3K0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0DtKeMa4Pd2GvQ/CpXa+k2INvnblUOKZ0/9dT+1/Co=;
 b=mfJwiCePlYQq4cVGf9VIwX/JdsiUz5Q2JB2ZE2Iqv8i68/IaO+udC+uNEtmlUSlGB2dsAG9ZCS0UXlhElZn7UPH4VejCvG5wlqdBKY+1tnrLp7Hw6K0/9xCMj1Nz9a5TVExaW9H/pIXvKtdMMn8N4MT+gy8sZC+EIZu/AD48iE746lMbepxNERgGosX6Hv7zi/O8mOiXEwB4jkbk3rEWcBy4EKHFlQAK7i8ZkcQdbAP1L0oAsy1KOz0ISdrtL02fcanJgTHcGuBG4EQ8ulKZjT586NApeX2aeBm0Jfzn3HGjWhUGPuhGfNdVBFJeJBkSYAiGIm7f+PK0Xj06qx2bPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR06CA0236.apcprd06.prod.outlook.com (2603:1096:4:ac::20) by
 SEZPR06MB6254.apcprd06.prod.outlook.com (2603:1096:101:f1::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19; Fri, 20 Mar 2026 10:08:23 +0000
Received: from OSA0EPF000000C6.apcprd02.prod.outlook.com
 (2603:1096:4:ac:cafe::76) by SG2PR06CA0236.outlook.office365.com
 (2603:1096:4:ac::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.20 via Frontend Transport; Fri,
 20 Mar 2026 10:08:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C6.mail.protection.outlook.com (10.167.240.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 10:08:21 +0000
Received: from [172.20.96.43] (unknown [172.20.96.43])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 173EA40A5A01;
	Fri, 20 Mar 2026 18:08:19 +0800 (CST)
Message-ID: <6d8520b6-04cf-4c57-939d-9baa5ec04360@cixtech.com>
Date: Fri, 20 Mar 2026 18:08:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: cix: add DT nodes for DMA
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: peter.chen@cixtech.com, fugang.duan@cixtech.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
 ychuang3@nuvoton.com, schung@nuvoton.com, robin.murphy@arm.com,
 Frank.Li@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
 linux-arm-kernel@lists.infradead.org
References: <20260319101723.246539-1-jun.guo@cixtech.com>
 <20260319101723.246539-4-jun.guo@cixtech.com>
 <20260320-attentive-turtle-of-perfection-c38ed3@quoll>
Content-Language: en-US
From: Jun Guo <jun.guo@cixtech.com>
In-Reply-To: <20260320-attentive-turtle-of-perfection-c38ed3@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C6:EE_|SEZPR06MB6254:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f64f3cf-62d5-4153-1066-08de86689e03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|7416014|376014|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: oj2SfV11l/ndXC/2ev76MB0r4+Y3WpyB5pj8G0OsVcJQxkE1obZl6/QHZaE18hFHtW8+9FYQB11qEJQ4wVpCbNgKt1WNNpQLAcM0ThDyJpDZJAsPQC5QmWnNXz3cBLWOlnqgIrnn0/Hqv/u9vn7rGrpES4iWiVqTusyouYnqS4ZsXOvAFiKNJZ3Q2qxZDWZfZ1Q4crolDbQjOvnUA9ZJ8pMCjP+bMIMIhsmVlomXK3uhy9B8/UWiQrMeys2+d1Oa1JKcL6DsZ8UmSta2v13fqnIIcmgb/QZgYdSOThJaDUaz9s8qHEY3JHcvGalfQqLRlYs44cZJtnGpUVztYAzz88R3kSBTlTdOC9eh4xNh1IEGyi4lJC2fnEWJiqGRPQz+9/05sAYZq7YfmTMR/7i7IdaUY4S9tBGu+e96jpb1IgQg68sTcbBdotExD24ipUcI1nLuwyUZ20Yi4vC3TNlS6RleHUo0nKqXBpaftHpcfDz1+xWbtKpMSyQ1X8bHvc0V9mPPQhtKJyyHQi0TN+wOXdeckRQp6DMFxL9PafA3ywI/tTbwRZ04en/Zba21Ok+6RY22QywK5eQp4UIXjdXKmYOk/VAFAeI5/vmkVmjq5fh6yR0jwPhgF/7dEYTtQXhUDFDiz6DfRQkoNbPhoA3naEuYVz2N9zIKedvqNC8/Rld12JYCQx9MhljRsmEmRcxKt1RDJIFSZNo7xKq68JbBo5nros+f2uRPRfLgi1fjtVIVnkBw4PsyYrpwCUBUMhO8T6IlusQepNY5C6O2GDp19w==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(376014)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: W9BzTzyH8wLqphb445SousjOp6TKwvFAPw8enGQo5PfI6/9caizQ4Sajf8XCVn5ekiGhLykfK8zQfarHtsAfx0yra63dADTUxjcIIu29u0R8gyZ4tAtNB4PUfrZSy1oDSNPMw7FX6OjeRomxKjtLG2O57FtvlMmQWqUwsFRi/pgYXojBn3ZiWaY1+5Pz2Of+o6xohcVbVAxpMxnLIASGxWLEtEDqXLY4qch5rfQ3r6iPExRR5pjFtPP7tUL7C1hreagoXPueoIsfgvhdBmRS7aBRv1n10RuDxRfVXppQY3QIMSU4GjciNQibcCjqRAdPmE5vTLCIc5mylWJ+xUP4nfdvrilKUyrTAFTdKbrfUhYEak4yAlfRqywaErQK96do7IXjOXntRFZHrDPvjUanJG/ZFX0qyLouv3sdDMBJlpwpoWUZDxaHb/7sexoOs3kE
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 10:08:21.4928
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f64f3cf-62d5-4153-1066-08de86689e03
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6254
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_100852_882960_AACFF497 
X-CRM114-Status: GOOD (  12.46  )
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



On 3/20/2026 5:13 PM, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL
> 
> On Thu, Mar 19, 2026 at 06:17:23PM +0800, Jun Guo wrote:
>> Add the device tree node for the dma controller of the CIX SKY1 SoC.
>>
>> Signed-off-by: Jun Guo <jun.guo@cixtech.com>
>> Link: https://lore.kernel.org/r/20251216123026.3519923-4-jun.guo@cixtech.com
> 
> How useful is this link? It points to exactly same code, so what does it
> tell?
> 
> Drop all Links from your patches and read the docs how they are used.
> 
Thank you for the reminder. I will fix these links in the next version
of the patch.
> Best regards,
> Krzysztof
> 

Best regards,
Jun

