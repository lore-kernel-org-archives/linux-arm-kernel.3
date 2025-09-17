Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB574CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 10:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EPwZdS+FgxTSnvODj/Uc7uS2y/7OlMC58h+YIVsBeWQ=; b=1iseT59PBrSAKbhYgHzSjxnoLK
	0QhORc0teI0RG4IW8TEi5zzrfQQ32RjPnnljJDi3+LSmtjMn34ZvVbSAFFXZAQbpfpZzvDKJXV3pR
	wWrwIPeo0YeYwuhpLZ4A5rfopt0Xsb3Gqbf9hmAxKBWO+CSN/gxSArxPa8V06o5SNoXlR2/S+ss6V
	5TY9PQVSWPDU0YIZ9nwnsbn9XdLURawNpJdT0rLILxWFFJGe1F9dTnbAJMOlPzX8HHfsTaerWRVC/
	S4QkmjdG+djpM4KATz3PbHVRy9D0PwXlpUfrZkQOiXejiJvlWoinQFGnncdgKhZxB6eQI5ixDcE9c
	En7l5a1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyp5X-0000000AuTm-359Z;
	Wed, 17 Sep 2025 10:08:35 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyp5V-0000000AuSk-1eQz;
	Wed, 17 Sep 2025 10:08:34 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uyp5Q-000000000JG-2t4D;
	Wed, 17 Sep 2025 10:08:28 +0000
Date: Wed, 17 Sep 2025 11:08:24 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/4] arm64: dts: mediatek: mt7622: add 'serial' cell to
 efuse
Message-ID: <aMqImGmz0uf_aTUR@pidgin.makrotopia.org>
References: <18af6977cc34de75e64279141dee69dcbc81c420.1758063737.git.daniel@makrotopia.org>
 <87179c9f-cc7f-446f-9e8d-c84bddb48660@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87179c9f-cc7f-446f-9e8d-c84bddb48660@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_030833_431258_33FB0E98 
X-CRM114-Status: GOOD (  14.64  )
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

On Wed, Sep 17, 2025 at 11:06:13AM +0200, AngeloGioacchino Del Regno wrote:
> Il 17/09/25 01:05, Daniel Golle ha scritto:
> > The efuse of the MediaTek MT7622 contains an 8-byte unique identifier.
> > Add a 'serial' cell covering those 8 bytes to the nvmem defininition of
> > the efuse to allow easy access from userspace, eg. to generate a
> > persistent random MAC address on boards like the BananaPi R64 which
> > doesn't have any factory-assigned addresses.
> 
> Sorry, but I don't get why this is named "serial" and not "soc-uuid".
> 
> Care to explain?

I don't have documentation covering the efuse content but only got this
information on an informal way:

https://forum.banana-pi.org/t/bpi-r3-serial-number/14556/10?u=dangowrt

Either name is fine with me, I thought of it as "serial number", but
obviously "soc-uuid" works fine, too.
I can change it to that and send v2 tonight.


