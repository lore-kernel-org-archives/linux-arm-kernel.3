Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA0FCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 11:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCBsG25MpOzEykkbBH/E55NK+Tl8cYqZNEQJun7ve6c=; b=JvRPMS4pqxOFstIxVJKGSZ3q53
	nX1kFgrP2ZPfREKEM0Jktxq/PR61ShzS1R0c/uxCGcFQX46pJkrAZmJGldoe9iT3PNK6iT1gta5ei
	QfBoxJpd9D9I3Y3AipVVmAUHV6VGWAYe282rx+Ptcmw0/JMhfo394oB3O1D78wUNZc77e/DLNFdlx
	wwuhce5a5FnvulXebP5+ODV8rc6LlRXLOpSguIYNNa0f/2WRMrH4nOOnP+CjvDo5yFiSB2r+7mIXE
	NlOpxTidlwyJbkl8HqzcHM8yMcgHUcZu9hcDdy46+2wNH05I4FbHmuqkcslYHTZ8pvapF2XP+zoNv
	h8FRxr8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwJ3e-0000000DqlG-3wD5;
	Wed, 10 Sep 2025 11:32:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwJ3d-0000000Dqkh-41T9
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 10 Sep 2025 11:32:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HCBsG25MpOzEykkbBH/E55NK+Tl8cYqZNEQJun7ve6c=; b=m1oYLV7hvAo1nIOZwBL7Zju4lm
	egWBAK0qUqBq18c0YVIhz7ucAQDgagOhGFBX8Q5DNHo6vOlAATMuPf5tgWw04k6AjhOFuVaHVgx+e
	N2geabJtDYuAWmE4VxLGVrH2Yc24G7xFTJ7nd+o/ubK19BMLjAgWNlkl9tOMfMO5DEu77Cv/j6IPX
	oDALriLw77C8q2KHOgyyj1CDiBt7/vEP+J3u9L7inhlGOPRspaODQ9ocTZuXfTkFWYZA0poKCFXmf
	8rJyGeqdnSyQ+x5Q8oQ35Go6SKjCqTpxTUaMmJYrkaLVRhgnI15dUMn5O+Zh4e/b4tFpfvlOLGeJA
	tQ5mnLaA==;
Received: from smtp-out1.suse.de ([195.135.223.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwJ3a-00000005qeT-3how
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 11:32:12 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 49AEE37A4B;
	Wed, 10 Sep 2025 11:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757503928; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HCBsG25MpOzEykkbBH/E55NK+Tl8cYqZNEQJun7ve6c=;
	b=XmnRsdoEWSmHkxJ1H9lzOvkpCZYMa6WLSfsDtAxJY30k6xTQFxckNOIY4ufGNaRpi8+5C3
	IKeWOXF6wbBVHMqn7q047noRuDFmXieWQBPw6YCCJ43H7ScRHyE4Z2VmuY0AJqIAymBO2H
	xqj3QIX4OkuVk7Wd6niCWzizhXjzj8s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757503928;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HCBsG25MpOzEykkbBH/E55NK+Tl8cYqZNEQJun7ve6c=;
	b=WQjoJjmBTrX+O1EvjPGtvjn5usQYCywN/2Ula2eTN2NSj/81PoGIuI6wvkG6QKQau4ywGD
	1thQuYUdbHo38xDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757503928; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HCBsG25MpOzEykkbBH/E55NK+Tl8cYqZNEQJun7ve6c=;
	b=XmnRsdoEWSmHkxJ1H9lzOvkpCZYMa6WLSfsDtAxJY30k6xTQFxckNOIY4ufGNaRpi8+5C3
	IKeWOXF6wbBVHMqn7q047noRuDFmXieWQBPw6YCCJ43H7ScRHyE4Z2VmuY0AJqIAymBO2H
	xqj3QIX4OkuVk7Wd6niCWzizhXjzj8s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757503928;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HCBsG25MpOzEykkbBH/E55NK+Tl8cYqZNEQJun7ve6c=;
	b=WQjoJjmBTrX+O1EvjPGtvjn5usQYCywN/2Ula2eTN2NSj/81PoGIuI6wvkG6QKQau4ywGD
	1thQuYUdbHo38xDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4A8F313301;
	Wed, 10 Sep 2025 11:32:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Ad7ZD7dhwWgQaAAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Wed, 10 Sep 2025 11:32:07 +0000
Message-ID: <0142ac69-f0eb-4135-b0d2-50c9fec27d43@suse.de>
Date: Wed, 10 Sep 2025 14:32:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] net: cadence: macb: Add support for Raspberry Pi
 RP1 ethernet controller
To: Stanimir Varbanov <svarbanov@suse.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Andrea della Porta <andrea.porta@suse.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Phil Elwell
 <phil@raspberrypi.com>, Jonathan Bell <jonathan@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Andrew Lunn <andrew@lunn.ch>
References: <20250822093440.53941-1-svarbanov@suse.de>
 <20250822093440.53941-4-svarbanov@suse.de>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <20250822093440.53941-4-svarbanov@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt,netdev];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,raspberrypi.com:email,lunn.ch:email];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_123211_091711_1723817A 
X-CRM114-Status: GOOD (  11.98  )
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

Hi Jakub,

On 8/22/25 12:34 PM, Stanimir Varbanov wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> The RP1 chip has the Cadence GEM block, but wants the tx_clock
> to always run at 125MHz, in the same way as sama7g5.
> Add the relevant configuration.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---
>  drivers/net/ethernet/cadence/macb_main.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

This patch is missing in net-next but ("dt-bindings: net: cdns,macb: Add
compatible for Raspberry Pi RP1") from this series has been applied.

Could you take this patch as well, please.

reagrds,
~Stan


