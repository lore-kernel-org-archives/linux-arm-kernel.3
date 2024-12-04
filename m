Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516ABE7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 10:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZdzII5ceMbqNid98twXA3JIe19RaQfzWoabBNJlaDw=; b=PQYAgUy6wUcDGmnA4B2Zyqpwtt
	iANJcPMK5fbJi0cdpi5pxKsI86DQAgWTY7CELBNwgL7I6d0z68skZvfz3h4d5Sigu7eJBPkQEhWLF
	FKb6jek2nMfJMaWeLER7GZLWHIQ5QjGfINK9P2BaxbdYjIW77hS3KYZd3V6PzZ9owqVaNZWTplwRP
	TzSDzh/8A+DiqzqOwpLvwz4qen5OgGMJePJit24npdoAtALXEmI8uEhebKdUsn46qJiYeZ32+gwl3
	jq33XG/88FyhlbLtlxVHfu8ulPJktTlhMvYzT3+rGXN1ep2i4wLAC0P4mlydtPILvSNdFuIEvrtwh
	914oBSUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tImKJ-0000000CAE8-0llB;
	Wed, 04 Dec 2024 10:09:47 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tImHq-0000000C9rF-2HAT;
	Wed, 04 Dec 2024 10:07:15 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4349f160d62so54099115e9.2;
        Wed, 04 Dec 2024 02:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733306833; x=1733911633; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rZdzII5ceMbqNid98twXA3JIe19RaQfzWoabBNJlaDw=;
        b=cXctohjjRXxIXlsmdmHvv+CEMUKaNJgdK6A4iuJEkjeocUS4AcZtWHkDBPaHc290xB
         w0DormlNrrfW2/0YuTHAn5wvvwIuxWGfsouDm6GeFrtTQA5dd8SDh6FA5nsKkuJKo+CY
         tNZwVrtqJj7ktCqItXVlxAAdi7vVBzlQv2Tfrhp6+YHCmo2MPCLfKWtoLOrpGmGj/XaJ
         pW85E+Own03ilEd7KXl+upxBir7+UxCnxAaiSwlnMs7fGSDu7hzmBfEmK1v2Q7dZpqQr
         KqDJTsaV3WZdVo51PGERgiPYdWq1FJHWwisHjlory0fDxo5K6rX1rfIsR2psI4VWoaKH
         6qNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733306833; x=1733911633;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZdzII5ceMbqNid98twXA3JIe19RaQfzWoabBNJlaDw=;
        b=iBOtBRgX4yOaZZ5ABGbSAk+1ZeXuZVI4QMo5jh2nEKzbZDjPw1VGCgw5BsTxsOPJ0F
         KGPYSSA0XAxgra59daHsInHATvMvY8hbu+dCTBmnwRuDY4swvwuQpB7e+Ri/D/9fCnF1
         eGMJT6ksRhnCgGqPf8fdUxWOREnNJ80D8BvmrCfveWBeDjMrxejdi8jztdFv2AkmRRfy
         3IDPbjqS5PcOTTMzqi8HIJNGDooPzHahB+1TFf+A67TLpys6p+D+eCp1enYbXNfoxTF6
         8ne4ElUL1FCnwWggSZ3RVLatzLaDFZI9xZfJXCtHbAqnF9NgRznWtzf9RbfLcjjJVabK
         mcGw==
X-Forwarded-Encrypted: i=1; AJvYcCUsd3y+fENurHBM+LhomX2cJG7Im5I7dMndBw4nfyJ0tA0kkHHugdIBRdXHBwtRwwDxsRbz5eM2jF40+h7M+Sw=@lists.infradead.org, AJvYcCXLkEL7JxQA5/WJLkRxveWBkni+cmpYQRDHx5GRsgcgwci4aAHiqc+8CnsntcHOrd+2TRKlXGk5GJthdcbgv6JA@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw+AZG1VQvt2tVRawQAfB6IBJ4Z60k7z0uMqj9a/X6uJh8zvqn
	ACwCIClYRGQAnu/WSz5vITSKMHgaugGPD6TdqOenrqFRER1JQ9FtH//ySA==
X-Gm-Gg: ASbGncvWXmauG/OrKOTgcyskvA5PeldymuJm2KuH8J9QImZyfASrFfG+DC9LfwL7fCF
	UfNH/2G2lKad0gUSjSnj87iuAjul9+NiU7M6LWMNYp/20EZ9ugEhjOAEj8pqLDBazXaKajdc/P8
	obtCKdkS4ihcP3aW6yW+QX0aYLrceZQxDeTM6SWbJJfmt8bgxHk0AMJhuWZ3P2LRuWDhV9tAtOZ
	wrSvNV1EZyVyyD/fjPL3NFntJlDXL/0HLrR98g8JIB4w/pfiD1xfloEGe5Sg9Liqu4qwQEMrFEM
	LmcmsQ==
X-Google-Smtp-Source: AGHT+IEmZW0+P/p4vKIwz6T1TOfzZOiXdf7VDC1j/nrxeJE9ePKA3vig1n3t7LFh49rBaBnOmNjmTQ==
X-Received: by 2002:a05:600c:1c8b:b0:434:a386:6ae with SMTP id 5b1f17b1804b1-434d09b14c7mr47619305e9.7.1733306832419;
        Wed, 04 Dec 2024 02:07:12 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e0d4778dsm14329018f8f.45.2024.12.04.02.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 02:07:11 -0800 (PST)
Message-ID: <675029cf.df0a0220.1d1837.a877@mx.google.com>
X-Google-Original-Message-ID: <Z1ApzDEAyyRrHy4u@Ansuel-XPS.>
Date: Wed, 4 Dec 2024 11:07:08 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v8 3/4] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
References: <20241204072427.17778-1-ansuelsmth@gmail.com>
 <20241204072427.17778-4-ansuelsmth@gmail.com>
 <20241204100922.0af25d7e@fedora.home>
 <67501d7b.050a0220.3390ac.353c@mx.google.com>
 <Z1Af3YaN3xjq_Gtb@shell.armlinux.org.uk>
 <675021f1.050a0220.34c00a.3a0c@mx.google.com>
 <Z1AoSSDqAbEisuzK@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1AoSSDqAbEisuzK@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_020714_577556_5F9A7AED 
X-CRM114-Status: GOOD (  19.89  )
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

On Wed, Dec 04, 2024 at 10:00:41AM +0000, Russell King (Oracle) wrote:
> On Wed, Dec 04, 2024 at 10:33:33AM +0100, Christian Marangi wrote:
> > On Wed, Dec 04, 2024 at 09:24:45AM +0000, Russell King (Oracle) wrote:
> > > > Added 5000 as this is present in documentation bits but CPU can only go
> > > > up to 2.5. Should I drop it? Idea was to futureproof it since it really
> > > > seems they added these bits with the intention of having a newer switch
> > > > with more advanced ports.
> > > 
> > > Is there any mention of supporting interfaces faster than 2500BASE-X ?
> > >
> > 
> > In MAC Layer function description, they say:
> > - Support 10/100/1000/2500/5000 Mbps bit rates
> > 
> > So in theory it can support up to that speed.
> 
> Maybe the internal IP supports this but the SoC doesn't?
> 
> However, I was asking about interfaces rather than speeds - so RGMII,
> SGMII, 2500BASE-X... is there a mention of anything else?
>

I can see mention of 5g Base-R so I assume supported but in the sdk
there isn't any code to configure it/I don't have any hardware.

(and documentation is empty for anything PCS related for register, just
block diagram)

I can ask it that is expected to work tho.

-- 
	Ansuel

