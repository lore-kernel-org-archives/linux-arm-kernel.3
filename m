Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C646AC282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/mDRp4/mkuaV1Yy1R0fVmKQrTdpMwxGr5IRopCnt1VA=; b=vm1TaKqe0B/GJFqTEs05z6JpRW
	1YiSVj6E4GiZ5Hs1GMikzbJvmKUJ0/o3d8KxgVW0+5WffPWgVyn7TPOuRmK1oCz3YXv/9/z5dwc7S
	umQCTrPo3yCaE0UtWe96HHSeibfvZzmvbi+t5LmdGT3rXtFdo+c3aOkZbSqO+78F4/ueh6R+W4oME
	x+T9bOcXPEeA2yX8I/u8DJ2XhKOu2aQMLUFSxGcuc2eM5SinLg9rRhQXopSy1MWbF2mEStdC7kZNQ
	X1goQ5caNudIcHneO6tDYZZbirRU+ez7JRwBeWhCo878PSUZl12zsTpXHi90FPLF/f8mHEb8j9ELy
	q/YqnMKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR5g-00000004Y5m-3FpR;
	Tue, 04 Mar 2025 12:09:40 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpQDx-00000004MBq-04rv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 11:14:10 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id A114CA028B;
	Tue,  4 Mar 2025 12:14:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=/mDRp4/mkuaV1Yy1R0fV
	mKQrTdpMwxGr5IRopCnt1VA=; b=O2Eo/diglpqOv6fh4s2gELtN/AllTdGKIItn
	ImtH3HyMZhCZ6Xan9Stww5iUxYWZCP1k8w2zigOw1zl0h64hBtqjR07B9YtIyW2E
	za9el3NCgabIWOEDlZr46F5pvo3BvH+sc05eYO76kx7N8Sj69LzLYWQfpvpRPsZL
	ezZuQqgP0Prd9us6q4wv/+7uDpC/eZfoOvdzEJ3tMmSzED4uIsvq/i5aW0OwvzLz
	KUQCo5g5rgLduUQS4l9bPMSdHlX9HSjryd6b62ahtQ686AhPXYdw6zEDjaSYQXAu
	NoR7bYMu2YCwd9dOaanQLXTThuDJcOmVEQpHpI0qvTZYVUIw6e3UFq4kMuqGrp9K
	1sc47k1o7D3+6Vx4C4YMTfJd3e0copso+vuyNlpY82edA6crKSAaRZTVbZf/re80
	5xG9POmujLgAe/vPeDkW+M5cKuh/m+AJnDjLLgz+v+VQyLllMf4uk9yeDgpBfT5q
	PG3DqdWZSDxSFU//zDaq6dpe4qH9BOFCLnddiM3x+Wlw8eiN+Uq6M6TZtWZC01/L
	PCmqwv99/kv9XYS7pzoZyroV/garfmCY+I+Z9VzNMWPRoNT7yoXEHlh5W5UlvOI/
	k2uaO1wP0+irRhZlgkI+R+95yfu4mJIfRNFxFTADwsMZkJ187nsXXcVo4Qjnku60
	85dx7EA=
Message-ID: <8cf056d7-22d0-4bf2-8dd6-79a45977bfc1@prolan.hu>
Date: Tue, 4 Mar 2025 12:14:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] include: uapi: counter: Add
 microchip-tcb-capture.h
To: William Breathitt Gray <wbg@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-iio@vger.kernel.org>, Kamel Bouhara <kamel.bouhara@bootlin.com>
References: <20250227144023.64530-1-csokas.bence@prolan.hu>
 <20250227144023.64530-2-csokas.bence@prolan.hu> <Z8bNFjh85p2jqK9C@ishi>
Content-Language: en-US, hu-HU
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <Z8bNFjh85p2jqK9C@ishi>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852637266
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_031409_531472_5A421B2C 
X-CRM114-Status: GOOD (  18.07  )
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

Hi,

On 2025. 03. 04. 10:51, William Breathitt Gray wrote:
> On Thu, Feb 27, 2025 at 03:40:18PM +0100, Bence Csókás wrote:
>> Add UAPI header for the microchip-tcb-capture.c driver.
>> This header will hold the various event channels, component numbers etc.
>> used by this driver.
>>
>> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
> 
> Oops, I almost missed this one! Make sure I'm included in the To field
> for the next revision. ;-)
> 
> By the way, b4 is a nifty tool that can save you some work and help you
> prep patch series for submission.[^1]

Yes, I have considered it, but unfortunately it still has quite a few 
bugs, for example [1], which has mangled my tags before, when a 
maintainer using it tried to apply one of my patches with it.

[1] https://github.com/mricon/b4/issues/52

>> +/*
>> + * The driver defines the following components:
>> + *
>> + * Count 0
>> + * \__  Synapse 0 -- Signal 0 (Channel A, i.e. TIOA)
>> + * \__  Synapse 1 -- Signal 1 (Channel B, i.e. TIOB)
>> + */
>> +
>> +enum counter_mchp_signals {
>> +	COUNTER_MCHP_SIG_TIOA,
>> +	COUNTER_MCHP_SIG_TIOB,
>> +};
> 
> Are these meant to be used to identify the Signals in the
> microchip-tcb-capture.c file. You should set the the counter_signal id
> members to these enum constants then. However, this enum doesn't need to
> be exposed to userspace in that case.

The thought was to let userspace figure out which 
`signal%d_action_component_id` to read, but now I see that this is not 
the way to go.

> If that is the only purpose of enum counter_mchp_signals, then we can
> omit this patch from the series and you won't need to send it in the
> next revision.

Alright, I'll drop this enum. Then this header will be empty at the 
start, save for the block comment. I hope that will be alright.

> William Breathitt Gray
> 
> [^1] https://b4.docs.kernel.org/en/latest/

Bence


