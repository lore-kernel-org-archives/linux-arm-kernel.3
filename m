Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09DBC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 15:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rxNeNoGx1mH4GH0w94NI93U/kEXE+lSVdRaFrGTDI0g=; b=bEHR1wNf0LGs0Q37U2D2FJZfsK
	YglqGxj6+XdGoublgjopcbxZrLwm+GFIlD1DZkXylK+Y+8dUYWguoc1cqsH5zijyBCV2LWaFPDJsQ
	jTlK24vpB2KBwNHlpPEYPoszTR7xNUN8NYciCHLgou0tyMPmETss4sNKBJt7Im79jPE+pqm/fTX5U
	x7SrKhlT31nv8aD/dafZd1/oq3EWsFJDCmfZWYnU5xhM2wB0H/eOYZlL3SfpkfEfsPfdUmUVocxJG
	TKC29TZYMAbl9rfpj1rSe9wzvBLSzcFXdmRhEqSiXjxbU56UT5FlTK5T4vZP/NMz59Vh+TFldPDs1
	UgFbMrTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uglyG-0000000GzrL-29oE;
	Tue, 29 Jul 2025 15:10:28 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uglvn-0000000GzYz-2Pt2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 15:07:57 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56TCpPUJ031980;
	Tue, 29 Jul 2025 17:07:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	rxNeNoGx1mH4GH0w94NI93U/kEXE+lSVdRaFrGTDI0g=; b=MKJFsGf/y754Tnvr
	xLdfD2hsDaNECBNZBmwKrazssfYyHo9DBQ4DdKdsN13xS5PgKmEbmoBLTAjq5s5E
	v3ee1pbRlyhjybenzVv6IpWfpM2LeWqmZlsEdD82pfYmXEt/uTJfL/xTj5mzz2eL
	euCEtL895eMzGzW9sCNXyqlw/cEEx5yjok5wH724M83/XgT3JmaLoH78eBlGZjRi
	ZDKRdC763CR4ysxOXrUsrNHxNUsPB7GEWk2L3FhzR3VS+XwT6F+thDHNSwq9XCEU
	ycCwSJG9uoYj+fy+vzJP7mVRbfKOJNc4FNNgIUUNYYKbMPu5lsfIJ631pbzkjFET
	4YtQmg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4859ynjf35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Jul 2025 17:07:38 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CEAB44002D;
	Tue, 29 Jul 2025 17:06:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8C5FA763987;
	Tue, 29 Jul 2025 17:05:40 +0200 (CEST)
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Jul
 2025 17:05:39 +0200
Message-ID: <b25eff85-73fd-45b3-b92f-5cc0a86011c7@foss.st.com>
Date: Tue, 29 Jul 2025 17:05:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/2] net: stmmac: allow generation of flexible
 PPS relative to MAC time
To: Jakub Kicinski <kuba@kernel.org>
CC: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni
	<pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran
	<richardcochran@gmail.com>, <netdev@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250724-relative_flex_pps-v1-0-37ca65773369@foss.st.com>
 <20250725172547.13d550a4@kernel.org>
 <424f8bbd-10b2-468c-aac8-edc71296dabb@foss.st.com>
 <20250728085818.5c7a1e45@kernel.org>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20250728085818.5c7a1e45@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_080755_881066_F316BC18 
X-CRM114-Status: UNSURE (   7.52  )
X-CRM114-Notice: Please train this message.
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



On 7/28/25 17:58, Jakub Kicinski wrote:
> On Mon, 28 Jul 2025 10:15:07 +0200 Gatien CHEVALLIER wrote:
>> Maybe we could compare the time to the current MAC system
>> time and, if the start time is in the past, consider the
>> value to be an offset. Therefore, any value set in the past
>> would be considered as an offset. I see some implementations
>> doing either that or replacing any value set in the past to
>> a safe start + a fixed offset.
> 
> Let's try this.

Ok, I sent a V2 with a proposal implementing this behavior.
Thank you.

