Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B0EE7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 18:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yta+XXMHP1ejgRZZWR5HMkhLHp1OT/pNiE2xb2AFLps=; b=PeLObI1Km0kHc8LnaExQpGRaY0
	Mkl22yh4Pmi1t276rCvMgmS23S9mFxL2PySjpq650pyqh/o39CayDJGePC/1uEZP0vTg91b9JYUeF
	yHlOBu0qqtCmU+8AUBon+R4azm9Awxxf+npysIc7/18JzWK1sylAHhiEmSLlpSaqxPmYMiZPh0AyQ
	SWMFKVvBaRs1lZ9Yz6agICflisq1m5xmUuLVz+w7MS4vz9AxEWzbXGN2OiMAw8XlfTy8OhcrrLQaD
	m8643r1V3+AuzpwYLKUby8zfcKNFACZEdmAZ0guDykXzKlhl2MHVlhE8k9EJ05WNsKpwpDj1EcaIF
	64GFrHIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGgz-0000000H88u-18L5;
	Thu, 05 Dec 2024 18:35:13 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGfx-0000000H7y8-17m8;
	Thu, 05 Dec 2024 18:34:10 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-aa625782fb1so16361266b.0;
        Thu, 05 Dec 2024 10:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733423647; x=1734028447; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yta+XXMHP1ejgRZZWR5HMkhLHp1OT/pNiE2xb2AFLps=;
        b=KMzNjcu5/cSeJCP/k0d6J+02g4/4gZjXjQXFD603t44/n5ke4snuDQNHG9Zv+YuMjS
         HYRBBHEU5CLIxRQiZPV+B9GvJxF1X9dIQKLE7c1sXbYDKQCkt26wE4Ly8z01ba9M5yEg
         RzgUBJNiAHZ1fuP4jpErjygVHwNdIk7HAIVa2LN1eHc6QWvU55tWLVnyU7pdtk/HHUg4
         lClBP5RUf3OKNW3MNY6sy7bWUVrtiIJydKcCNCuBP/66SlgxK+wupsKqiAIz9ldz0S05
         y20Ehhf7h9E8jIvg9SKfPZIZbljEJmD6Po2VCQ2cPwPC0P8mn3LY7dKfPW96oBP8GjhZ
         I1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733423647; x=1734028447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yta+XXMHP1ejgRZZWR5HMkhLHp1OT/pNiE2xb2AFLps=;
        b=VhZOMC2rnIyFj/qo3uYT092e82EtZ8arEa/DOUwTHSj/sZE6sDG0U+vfM9oYfGfSVq
         +hpd6/fMKCQpa/O1/tMypa1NOjYHbrJ9fnd+/UnwzSseJ33yhofumn6HmmDVSQy43Wjd
         /EmSyY4sKhQ/J7/HsO1anaNLgmTz2fAcGK4h256MSPT3uR9I/I0eSfZ08RumVOwk8F5D
         Bt+wpVX39K6PpiMHS8tlXHt7vxklQltX+4d64mAfBJgw2rMO5YfdKVcptU1P0b0HZQfs
         g2wsawlk1ivBJQSdlgR9P/13t63FkOxEtsOco5SQECKG49x2pJZz99PGZL859CxagQHi
         +sJA==
X-Forwarded-Encrypted: i=1; AJvYcCWKXZ9vZuNCAL/QIZpe/S3v1oJTZMQU6pnmPPM8eW2dfrlVtkURWSlJ5J4BjXJ+aX7FyzRF7o68AxcUN63y68I=@lists.infradead.org, AJvYcCWtFrctGPnfFN8DDJfz3axTTDTP7bb61ZrcSV2cXlQD5D90Fne0GmJ6Ny6TjIodWMOKp465IBUOaJUSGKUyI+r2@lists.infradead.org
X-Gm-Message-State: AOJu0YyptJzhUkJ8nGEghl2Nt5RCw99aen+AihlQzyjNm/ZYryJEfOXl
	QKh4FTHhin/JOw+d9FhjiYeFFlEABPaF9Mw8HVvtofa8+weVdp5q
X-Gm-Gg: ASbGncupX8o1MFSLcgvAoxQlH1kGTtY9YOSdobo9QSs2eYd6B7vCrNyVlxkVRf6BDSM
	QSt9/00D7RmLtsu5jyz1o+Ok9jzTqTDVXfAwB2HpzdveUhKwvjve44y9xxN94OPrU9OQZOIT9hT
	WB8rbS7aH7aKv+BYXUuXKAeMG2oPn+UStnHufaLFfBayUJZYGRl0PeJRjzaZzmV7G21gd1C/n+3
	T7A6MsFvkUm+r08GqjhNuDs7vj+BLzZR8Po4O8=
X-Google-Smtp-Source: AGHT+IG4CYEfyQeKmQp0tq23JHoVrVPDcBsqZFNjm8gaj1DxcM0BYc34ahZP6mtlpoMmYTjT7JB0lQ==
X-Received: by 2002:a17:907:72cb:b0:a99:482c:b2c6 with SMTP id a640c23a62f3a-aa5f7dab976mr476916066b.8.1733423647107;
        Thu, 05 Dec 2024 10:34:07 -0800 (PST)
Received: from skbuf ([188.25.135.117])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260a3a89sm125047166b.171.2024.12.05.10.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 10:34:06 -0800 (PST)
Date: Thu, 5 Dec 2024 20:34:03 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v9 3/4] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
Message-ID: <20241205183403.zla5syfzj3yrinwj@skbuf>
References: <20241205145142.29278-1-ansuelsmth@gmail.com>
 <20241205145142.29278-4-ansuelsmth@gmail.com>
 <20241205170629.ww7qcvgbqdf5ipcj@skbuf>
 <6751e22d.050a0220.3435c6.57de@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6751e22d.050a0220.3435c6.57de@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_103409_305852_3F97213B 
X-CRM114-Status: GOOD (  23.59  )
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

On Thu, Dec 05, 2024 at 06:26:01PM +0100, Christian Marangi wrote:
> Concept looks handy, ideally I can just assign one ID for each port
> like:
> port 1 -> FIB 1
> port 2 -> FIB 1
> port 3 -> FIB 2
> 
> Question:
> Ports of the same bridge should have the same FIB?

The answer, as well as many other explanations, is under the "Address
databases" section of Documentation/networking/dsa/dsa.rst. Please read
it through before starting to implement anything.

> What I need to check is how the switch handle this for learning. Does
> the switch correctly create FDB entry with the right FIB?

You're asking me how an8855 behaves? I have no idea, I never interacted
with it :-|

The idea as far as the DSA API is concerned would be to learn addresses
in the bridge database (DSA_DB_BRIDGE) that the user port is configured
for, and not learn any addresses in the port-private database (DSA_DB_PORT).

> If that's not the case then I think assisted_learning is needed and HW
> Learn can't be used?

ds->assisted_learning_on_cpu_port applies, as suggested by its name,
only on the CPU port. On user ports, address learning should work normally.

As you will find in the documentation, the CPU port is not like a user
port, in the sense that it is not configured to service a single address
database, but all of them. So, source learning on the CPU port will not
work unless the switch knows which address database should each packet
be associated with.

In principle, one way could be to pass, during tagger xmit, the database ID,
so that the switch knows that it must learn the MAC SA of this packet in
this FID. I don't have the full image of the Mediatek DSA tag format,
but if an8855 is anything like mt7530, this option isn't available.
Thus, like mt7530, it needs to set ds->assisted_learning_on_cpu_port, so
that software will call port_fdb_add() on the CPU port with the correct
dsa_db (for the right bridge) as argument. But I don't think that is
going to pose any sort of issue.

> (I still need to check if I can assign a default FIB for a port...
> Currently the STP register are 2 bit for each FIB id, so 16 different
> FIB are possible)
> 
> Also do we have a script for selft tests? I remember there was one back
> in the days for fdb isolation?

I don't remember right now, I don't think we do. I'll try to come up
with something in the following days.

