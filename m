Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A206C88E7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 14:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZ4W1UtZ+gfAJ2S2H6vEINh2v09+juTrXnaQsKKsnfw=; b=3eHm/K21UlVYtbJ57oKzAVcVu7
	dlqGNFmnnqR0g8EqKNDCJMT5lLy7nAQBMBHAHpvjurZuSRTa5Tx33yXjVFROWrNDz9QivYkwW6Cut
	skwJFjT9fp2kN5ipHb9PPk0lbx9tGs3XmovAs0x6sCPICNaTOL1GLIF8gu3Hhy1layZ9Fc8TtYMOv
	D/K0glr99Q2FTFzsMx266GAK6ehXRP6ZIAwMrJEUsy/wc+lOZdJ4wXOo16+H0kP8jlgzUO6r4Iwtk
	L63WwoQxdaDFXE630rZgihrjFdq3zassi+EFCKKGZL6csnBDXBpr/NMltv+LsGxBqajntWs+olVC8
	DFAwj4rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6U18-00000006uRo-3hut;
	Tue, 15 Sep 2026 14:20:14 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6U13-00000006uQF-3m1v;
	Tue, 15 Sep 2026 14:20:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789482007;
	bh=X1uRYjOBwsQk4iHixraLfF+7oZ/5RTXpZmOTIJejqFk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZiDzqsNKBx/4yVFHZvk0UwXUhf6U8SA/B2rLokXztM2+XKBQC+htL3RWI5/VUudqA
	 bkQFhiP0OfYGSbMdgn8w8IHgq2wNhv1ZEHxcYgvjZMpYfG3XNywMkXrVPvRdcDRVHo
	 1t6iOJhQb6vaODAuUfcB/uXehItzGU5ecmtX3bNZIzCHX1Foeik2fBBaXjcCiIeVga
	 sIWomELTygiQHlizuVkCGR4dzKmhcg0mASjsYJNf1cG/VQMCmfhIhfm6pY2t2iqWLP
	 0FLxOhmfm/q36jNXhSrerWHFFqbKIHKoHe47/8yv+NMDBcc0MSGlw2cWUAYuG+KUNg
	 VS3cioWafcfWw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7C94D17E0082;
	Tue, 15 Sep 2026 16:20:07 +0200 (CEST)
Message-ID: <2203bb2b-9490-4d2b-8ec0-bebaaa9148b6@collabora.com>
Date: Tue, 15 Sep 2026 16:20:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] arm64: dts: mediatek: mt7986a-bananapi-bpi-r3: add
 ramoops region
To: Martino Dell'Ambrogio <tillo@tillo.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kees@kernel.org,
 tony.luck@intel.com, gpiccoli@igalia.com
References: <20260915141226.600486-1-tillo@tillo.ch>
 <a463a9fd-dddd-4b78-8408-2be683f80f13@collabora.com>
 <20260915155333.821189-1-tillo@tillo.ch>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260915155333.821189-1-tillo@tillo.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_072010_098896_B2DC11AD 
X-CRM114-Status: GOOD (  12.35  )
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

On 9/15/26 15:53, Martino Dell'Ambrogio wrote:
> On 9/15/26 15:27, AngeloGioacchino Del Regno wrote:
>> You forgot to send the 7988a bpi-r4 patch :-)
> 
> It did go out - as v4 rather than v5, which is probably what threw the search
> off. Only the BPI-R3 needed the v5 respin, because its v4 accidentally carried
> the BPI-R4's values. The BPI-R4 patch was already correct at v4, so it stands
> as sent, and it does carry the plain reserved-memory node you asked for:
> 
>    https://lore.kernel.org/all/20260915135722.566918-1-tillo@tillo.ch/
> 
> Same To/Cc as this one, sent 13:57 CEST, five seconds before the R3 v4.
> Patchwork picked it up as 14818166 in the Linux-Mediatek project.
> 
> Happy to resend it if that is easier than fishing it out of the archive.
> 
> And thank you for applying the BPI-R3 one.
> 
> Martino

You're right. For whatever reason, it didn't reach my inbox.. go figure.

I applied the other one as well, thanks for sending!

Cheers,
Angelo

