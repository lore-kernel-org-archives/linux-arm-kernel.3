Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B12C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 21:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gr9VEPaQiARLAyCwAlhOr4tBEEh63PrDoIaQP0hl77Q=; b=0NWvq+GuCwQhzVMON3Faf24JbT
	yb5TLm7ty64hsKa0Cz8MA/M56MvXqjxLX+FXm/SoudnYLZY2HxWxiTAS+n5m+yxmQuameRCa/Klon
	i9Yn10asg3ezc9Z7q6d1AwJsAroAjTlfTj/scUiShYN3yDsz/82zXwWAspjWprf/U0eGjv7upIfuh
	T/aFPDfWl7r2VJQ3vrhtz1HVutonPOzUEP8+cEe9azEZ4ql7KjimDNU0ex++MIlktELK/6+/0rpAi
	8pIykBRmMueLMvHJy0qp0V9ly/T7ScW8kjyuI79TpVsWbgJ+ZKPWcBtxLrZs7WwcMrFvOzAJqIp3T
	I/SCqNUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgWEi-0000000BIoF-3OKR;
	Fri, 07 Feb 2025 21:50:08 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgW3S-0000000BGYu-0aJU;
	Fri, 07 Feb 2025 21:38:31 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ab7908ecb31so17073466b.1;
        Fri, 07 Feb 2025 13:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738964309; x=1739569109; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gr9VEPaQiARLAyCwAlhOr4tBEEh63PrDoIaQP0hl77Q=;
        b=TSqrqnnm4b7O4F/YlcIT1unMn7+5ArQeRNVl+ZvxuYzBIjroR1YEJbuWjLPh8b87y+
         0/lllyWfWFfcWLeg4JyWOyjxFpgMxZ2MydWBMle1WdxJ2i/b7XGZXfUagaqRmc/FwEYM
         Mrjbzs5xkeIxWsT2wZX5n8wxZTHMlc4HidYn+FW4ScFRTO+lHSy18zOUrDvAJfL8zgxt
         m0k2qVV8d5J254tD7pX+HX8UywBcrKy94RzCcS9uAA17qmNywjspbLoIfxI4bhjpaH4Y
         qvSpqABRXjXnGq8PhUrRj53fCz2dYPzjrUGfR8D53q62xC3gDI8oUnn1nTgOyCbRIGQR
         R1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738964309; x=1739569109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gr9VEPaQiARLAyCwAlhOr4tBEEh63PrDoIaQP0hl77Q=;
        b=AGjKcuUz6gIgX2JAlLD4pnWbF+Vz3fh//xYbEPOsisCRd/cRvygZ/+BkrWwrlugnKo
         MKUSAfjqqYjNFs2PzSB+Pmh+DtjIk0idrpAfPnZm0EvyXMsdqTP15yuEZGTBSKwVInjR
         pHy0idqamt+MXrT5qqGe9eeg+HC7XZO4ecAbAq0vLl689I1IkKO4yQRYY5tobMv+KcWh
         5/QZcHJ76md/7Y6qFMXYh2BlcFbszEEZ75LXH0LlGu/rVI0zObZr6LUj/YQ74WQV1eWA
         fsLTRWPATvpSSws9cjTrl1TVhHeSHg/jNYQHZSJI8RrztO3I1XSEnRp3/i4x/ghYOX6V
         clyA==
X-Forwarded-Encrypted: i=1; AJvYcCWTAgm7yvnJ9WDNLyqYcxfu3oWsvwzbvww/friCViLsZRwa/CidF82z9iecjj9A2okzwoeRCqSHwmsjHzPUp9tA@lists.infradead.org, AJvYcCX70AJotwuyt5MR8deh6saMU+lEawIF3rK6mzh/K3ISc4B7dzeHs1MlbgDkWYzQPi+M+7WPPveO7mSp/9vFNCs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzDBvOmOuFimWjxsElWCs+XB+WbShvWtoYrIZKYXb2zsFnSrjVI
	ontTwxLEYfOxq6S6x8M3c/wsIPAXurPgOkqjmHcJl447+1sUC8xuknrAOA==
X-Gm-Gg: ASbGncseS9OjiGxbE0tXcOU2D5q2P4EFnKU+h3/N7vnpQn9EIZ6q/nGLC3Q5cap7I9q
	MKb0U3ip3yjOywwwPJicywquRyTw2GNtAetfBSulcZO0KHiYaeO3iWPHaQ2Avr0G+0llI285Cll
	Rs9y4CJIKi2LvPe9bh969UDbgKfK203GhoOoLVULTrm2krXsSNuuJ3B6oJFg4EcYwcLRnL8wEZe
	0EvXlaPqMTbuLD6clzwRE8K9Q7aj4GQvPyRIkW/W92bQnfwIGGmOjFosTJ6UCYggbRwU5VP2OgT
	MSQ=
X-Google-Smtp-Source: AGHT+IEbl3ScrFja/NJm9wAQ69PqhUaZeve8wDcZpAf9mkb2psE9C9zpwnLLE8BSnYVHKlIS6q1f3A==
X-Received: by 2002:a05:6402:5254:b0:5dc:740b:3cd9 with SMTP id 4fb4d7f45d1cf-5de450aba25mr1916038a12.5.1738964308342;
        Fri, 07 Feb 2025 13:38:28 -0800 (PST)
Received: from skbuf ([86.127.124.81])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf6c9f8besm3202574a12.52.2025.02.07.13.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:38:27 -0800 (PST)
Date: Fri, 7 Feb 2025 23:38:23 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net-next v2 2/3] net: dsa: allow use of phylink managed
 EEE support
Message-ID: <20250207213823.2uofelxulqxpdtka@skbuf>
References: <Z6YF4o0ED0KLqYS9@shell.armlinux.org.uk>
 <E1tgO70-003ilF-1x@rmk-PC.armlinux.org.uk>
 <20250207151959.jab2c36oejmdhf3k@skbuf>
 <Z6Yn2jTVmbEmhPf9@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6Yn2jTVmbEmhPf9@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_133830_175905_353DFA23 
X-CRM114-Status: GOOD (  16.70  )
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

On Fri, Feb 07, 2025 at 03:33:46PM +0000, Russell King (Oracle) wrote:
> Bah - actually I _did_ update the patch, but in a different tree:

I'm glad there's a reasonable explanation for what appears to be an
oversight on your part, and I wish to make nothing more out of the event
in itself.

I just want you to know that it was really hard for me, looking back in
that thread to make sure I'm not misremembering that I asked for this
change, to get reminded how quick you were to jump to an insulting and
sarcastic conclusion in that same reply. It was a shit reaction and it
really didn't sit well with me then, and it still doesn't sit any better
re-reading it 3 weeks later either.

I don't like it that the more subtle hints apparently pass you by, like
me leaving a link to your entire reply, so I have to tell you straight,
even though I like that even less. I want to respect you and I'm very
careful with my words around you, Russell, but I need to know that you're
mindful of your own reactions too, because otherwise it makes me feel
that we're on an unequal footing.

Whenever you make a sarcastic comment about how people don't do what you
expect them to, as if the only possible explanation is that they must
not have read what you said, because if they did they must be dumb or
something, you just put yourself up on a pedestal where you're above
making mistakes and above misunderstanding or not thinking things
through - which is such an obtuse way of looking at life. And so, when
you make mistakes like all humans do, it's really hard for me to react
in a way that isn't just giving you back a little bit of your own venom.
But I've tried that before, and it led nowhere, so now I'm trying to be
kind, which to my desperation seems to be treated neutrally/not seen,
and it's just too much for me.

You know how with Andrew, whenever he says something on the mailing
lists that you disagree with, you never make a sarcastic comment
about it? I want that too, and not because I dare to compare myself
with Andrew technically, but because the way in which you treat a
human should not be based solely on your respect for their technical
prowess, and you shouldn't get away with reactions that stink because
you're good technically.

