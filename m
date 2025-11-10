Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E7CCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 15:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ITk2tlVBaQjDuhVGmfM1Ssxn9cijCmVpO1LtokiUxJs=; b=2UvSIGhfiaR0QNSqCaUEohDTF1
	JFIKTaJhRzb1lYxaDVb3ySDHG9YLLalg4ksX07QJ1jmVdi29OwgnMqDbSOgK6R5pPM1vdEqG4gbWk
	HIXX56NB0viZg6OsoErk+KmDNRDu4AL9KbrazpB0DAtzvhj574J4CdwhsiRd8p+RdLkijtVfzAz7g
	OpqHY8GMhSAa+1wKy1+sjE+tmqHn+KobVNzs/RD9dctf0YNNs+cBSp8Y3nkL0NTsiVSTjN7DM1N6J
	JbmR54y0ZNdmultc8TpTabH7I6PyDmEVBEX/Hhz+JYXVLFstr6jJfCn2Pmc5HaUEXISF45V1kCiI9
	lf2WPyTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITWm-00000005esu-2aGo;
	Mon, 10 Nov 2025 15:09:56 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITWi-00000005esO-0DpL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 15:09:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E696EC108F0;
	Mon, 10 Nov 2025 15:09:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 579BC606F5;
	Mon, 10 Nov 2025 15:09:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A8E9E103718D6;
	Mon, 10 Nov 2025 16:09:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762787388; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ITk2tlVBaQjDuhVGmfM1Ssxn9cijCmVpO1LtokiUxJs=;
	b=lskziJm4fsclu4FaTekH9dxP/2NHPq+nAMrvdOXguQraaRFoAwSqtgwmOubO74gBVU5OHj
	Qe0zqm9bh4y2vxPGkvIGH0lLofxzvCPwQMqY6LtqUdY2LNSGJ98oMHdxK6fnZ50IMbswwb
	MFzyhoUVbWVr89lmYUJy9FPARXJlTkpOB5eYV3ZPhqXyQyYNnPfXrMLbcvOZbHZxZkN5ah
	jN+RiAB8sKmWMSdXDPWG3Cs4gDMVHbtdkK/kdbqE1FGDLAEcKWTbzvdFEgAm7hW4bWHOPZ
	sDXHrkEtgF4gNgugvaUp9AWJQv96RwXwLv4vhKcqh2DC0KMGwmq28MP7rUnKbQ==
Message-ID: <7cf0f824-2ebc-4e67-9f26-5a1f0ad4c8ac@bootlin.com>
Date: Mon, 10 Nov 2025 16:09:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] firmware: ti_sci: add BOARDCFG_MANAGED mode
 support
To: Nishanth Menon <nm@ti.com>
Cc: Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Gregory CLEMENT <gregory.clement@bootlin.com>, richard.genoud@bootlin.com,
 Udit Kumar <u-kumar1@ti.com>, Prasanth Mantena <p-mantena@ti.com>,
 Abhash Kumar <a-kumar2@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251017-ti-sci-jacinto-s2r-restore-irq-v1-0-34d4339d247a@bootlin.com>
 <20251017-ti-sci-jacinto-s2r-restore-irq-v1-1-34d4339d247a@bootlin.com>
 <20251107114116.f2laylu5yziueyia@budget>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20251107114116.f2laylu5yziueyia@budget>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_070952_246582_FF0BC0DA 
X-CRM114-Status: GOOD (  10.15  )
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

Hello Nishanth,

Thanks for the review.

On 11/7/25 12:41 PM, Nishanth Menon wrote:
> On 16:44-20251017, Thomas Richard (TI.com) wrote:
>> In BOARDCFG_MANAGED mode, the low power mode configuration is done
>> statically for the DM via the boardcfg. Constraints are not supported, and
>> prepare_sleep() is not needed.
> 
> Will be good to get pointed to some documentation around this..

I agree, but for now there is no public documentation. Once it is
available, I'll update the commit message.

Best Regards,
Thomas


