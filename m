Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761CDCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 13:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d2L0IHYq4lSe4O6uKVHGkcE52lAJdyJhzoj9QeZWclQ=; b=NHmDVa0q42KoFrXnnWQeUy7W9m
	PJXZsh2vwZj8XulRQQcWIwnNgsfuKhNOCLTBCtuIVh3lxU9MZ6mNsSOiB4gDhODIcQ3MHiLLOhZoV
	FwnUw6J886o6PHZ4JVqgUThfstxFoFZoy5Prs1ivWwrTUuEKyga76Eva4h5aUmCIYyqcIvDRfRYo1
	dfZxwmSIa4z03cZ7BhUGkKjvtdDKo0s5klH7orVxMDBr5uKae7UybdMdyl6viWVCfCK/Gzkqlqo5q
	TdqY6yF+n4mXn8Bo2NEIUx2G9yvbTvOBDPnUzjMBkR9IJoHsjUtQ6iU4y8q/AxJbTutww6YzIRM85
	r76mA69A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGdlO-0000000Dnlc-1k6x;
	Wed, 05 Nov 2025 13:41:26 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGdlL-0000000Dnkm-3uEK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 13:41:25 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8B40C21195;
	Wed,  5 Nov 2025 13:41:20 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 89B98132DD;
	Wed,  5 Nov 2025 13:41:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HUsfH/9TC2liHAAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Wed, 05 Nov 2025 13:41:19 +0000
Message-ID: <dc641a92-51bb-4740-8aec-e6fd1ef988fa@suse.de>
Date: Wed, 5 Nov 2025 15:41:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Add watchdog support for bcm2712
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Stanimir Varbanov <svarbanov@suse.de>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-pm@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Lee Jones <lee@kernel.org>,
 Willow Cunningham <willow.e.cunningham@gmail.com>,
 Stefan Wahren <wahrenst@gmx.net>, Saenz Julienne <nsaenz@kernel.org>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20251031183309.1163384-1-svarbanov@suse.de>
 <CAPDyKFqHizQKSDCuPopNBWtt1mNCNuWegv9c=PcXEEVaUaP3cw@mail.gmail.com>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <CAPDyKFqHizQKSDCuPopNBWtt1mNCNuWegv9c=PcXEEVaUaP3cw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Queue-Id: 8B40C21195
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	TAGGED_RCPT(0.00)[dt]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_054124_119612_DAE9ACAA 
X-CRM114-Status: GOOD (  12.29  )
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

On 11/5/25 2:52 PM, Ulf Hansson wrote:
> On Fri, 31 Oct 2025 at 19:33, Stanimir Varbanov <svarbanov@suse.de> wrote:
>>
>> Hello,
>>
>> Changes since v2:
>>  * 2/4 - Use maxItems instead of wrong minItems in else clause (Conor).
>>
>> Comments are welcome!
>>
>> regards,
>> ~Stan
>>
>> Stanimir Varbanov (4):
>>   pmdomain: bcm: bcm2835-power: Prepare to support BCM2712
>>   dt-bindings: soc: bcm: Add bcm2712 compatible
>>   mfd: bcm2835-pm: Add support for BCM2712
>>   arm64: dts: broadcom: bcm2712: Add watchdog DT node
>>
>>  .../bindings/soc/bcm/brcm,bcm2835-pm.yaml     | 38 ++++++++++++++++---
>>  arch/arm64/boot/dts/broadcom/bcm2712.dtsi     |  9 +++++
>>  drivers/mfd/bcm2835-pm.c                      |  1 +
>>  drivers/pmdomain/bcm/bcm2835-power.c          | 17 +++++++--
>>  4 files changed, 55 insertions(+), 10 deletions(-)
>>
>> --
>> 2.47.0
>>
> 
> Patch 1->3 applied for next, thanks!
> 
> Note the dt patch (patch2) is also available on the immutable dt branch.

Ulf, Florian, Conor, thank you for the help!

~Stan


