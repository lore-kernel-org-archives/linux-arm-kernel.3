Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841E3C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 07:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZXtjZfZaiKjV8pxyq15n6Y19W+V1TF7wJPTAdWOpVU=; b=fhTlWJ8cj/et9JUWvqYl/b8UPw
	E5bEPW63bP0FWK86pK/9ltSXbecjAZBv1/iDXsGECf1NkD3gI+Daqij3GELwhluS27JMPel0SCNAQ
	3+j2Uw6EuxsqGu102p1AbOXd+4F9c/qth3AMYDW/1HUmuCT7TaHPLqy4RHv9jUocLAVnXKEgGffxP
	aDDYEYnRczIze+80gXiwLMBInzxeFCq1Xb1uxi0NpaCCVY8DZUM1ou3MBteWNib0H5SJLkwoz+ki0
	9Fj2kiyM+epKVeCDKkHobXnrDMrxODIIPhbuk4JtZ7IJtd41t+tDE6REMWSJmzJ59G+xcXHuJ/h5O
	hFpQEieA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Pp3-00000006QAu-2Wu4;
	Wed, 09 Apr 2025 07:26:09 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2PnH-00000006Pze-2x1f;
	Wed, 09 Apr 2025 07:24:20 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso43101775e9.1;
        Wed, 09 Apr 2025 00:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744183458; x=1744788258; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aZXtjZfZaiKjV8pxyq15n6Y19W+V1TF7wJPTAdWOpVU=;
        b=CJL3dSttEOiJswC7m6TcWtfjOtvk1XaRvJ28jGg+8nTWXpilHEV3Ii/oc93mOA4kBg
         ANLQbLTyn9YkKx/UAemIDHhPExM9ydmzdJp6qGdMlnCK+NvhOU4ePabuYHvcT19LRd87
         Ha27aAUFJh6HDf2DL+j/1XhQNN82U2k5WPBDUPDnpWsEZzokajSngPd0rMJAYFUxmjvY
         Pes/aSR/EPpicjr4zSM8h2lGUg+NBB9TqzC0LSlPjNHhJnIstiBzr9rzQ+TdnDUKeWtj
         DLL29KpSRmvkm1Psd8K8H7I8kLCwOZwiRpP9xMadhyQBl4qB35hpoOL4n9qpenCjkdT2
         676w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744183458; x=1744788258;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZXtjZfZaiKjV8pxyq15n6Y19W+V1TF7wJPTAdWOpVU=;
        b=Zi4h9KGCl1Vlv6K76c0BjXnwhcIWgyyrz37vNivi9i/ylLiaV7tuVCvVSVOpxhJd9s
         18qC/8ysWXGuhmZ54VVk6SWXZJt5Rf+WTLoYxFjMIQ1wYxSUzdgQtdhVs+Rwj1z0Kp5i
         PLP2LStYCf8KysafC9TxTEI7IofkINdPD8gh++6eAg1HIFh+FE3xLG0iDbJAlYYbOXfd
         PbZr6ezfAjKCeiGCBQKTTu62E5F+Ih4HkSXHIXOytdmj83+8eOxGorvhjgPn5K4lP2Sf
         tthnXtkr1grrGhc7WSj7Rb63AKJRokYSVDACE2GBPObWqvfaXXe/70cl/00t8wAgVGPA
         2XkA==
X-Forwarded-Encrypted: i=1; AJvYcCUB7ucMRxKlrw4b9IyQlEIKaojzp37eLlSf9fJDJprvvcx8I6eWkve8DVPW0CV+Akn0X/bdHM68vzI8/85NATw=@lists.infradead.org, AJvYcCUrapkxLZj/EOviIryG+hMOUW1d2N+1NkrW9fnipApgXcdTCZR+UoGPMuc0TBUjcCuczlY8f2IT3Iet214EgSGA@lists.infradead.org
X-Gm-Message-State: AOJu0Yzrws/Ng1IalTVB669EyFPpkGY8FS8XlSEud2MGC2GSFRPAcGTS
	cXXT8PkFJTaOazh5kJtXNC6+7HJVNI8d5fp12oaQDyzWWQWZhezx
X-Gm-Gg: ASbGncv+P0W7M3XXvlmf7bWjXVIWSXYCQhGe6HEEtCMeOd9RJJSvAZtNKairG2mmh9n
	4rzz6hza+SgciL8J5QudOXWsLp3FQzMQpeyYOsiC/ZFFto0M9+X1Zkmk/ejGgMLnVSfo+DU12x0
	Ohys48P7grnO6IYWG+NpVckUm2VlWqqq6S4vPQFsIay3aj8v/7WZw+pJFB2HDgh/bNn69437XI0
	viNuvnmkBFkLkdm21hB+JdEMGFr+sQQlYiW55IEelezpEa6mUr5bFCgFOOYK7ZDBrunKm7JBCRM
	OYUh35vb4LwAul+6VkkZ2VAn/R3Zn298AjjQmw7Ub7ufxRuP1d/9N64yqaVv/nsRJyADs7qb
X-Google-Smtp-Source: AGHT+IGmE5yR1RN6Y7itWh5Vm0T8GjGIHHBkIqnzUxoL1+oe6xxmSqm3+M+hIS7IhsxEa2DRXkctcg==
X-Received: by 2002:a05:600c:a0a:b0:43c:e7a7:1e76 with SMTP id 5b1f17b1804b1-43f1fdc3f1emr12061765e9.1.1744183457625;
        Wed, 09 Apr 2025 00:24:17 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c8224sm6776875e9.22.2025.04.09.00.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 00:24:17 -0700 (PDT)
Message-ID: <67f620a1.050a0220.347fc7.1fee@mx.google.com>
X-Google-Original-Message-ID: <Z_YgnQEv2i8n3uA2@Ansuel-XPS.>
Date: Wed, 9 Apr 2025 09:24:13 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v14 07/16] net: mdio: regmap: add support for
 C45 read/write
References: <20250408095139.51659-1-ansuelsmth@gmail.com>
 <20250408095139.51659-8-ansuelsmth@gmail.com>
 <20250409090751.6bc42b5b@fedora.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409090751.6bc42b5b@fedora.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_002419_755821_2C1A6B5A 
X-CRM114-Status: GOOD (  41.68  )
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

On Wed, Apr 09, 2025 at 09:07:51AM +0200, Maxime Chevallier wrote:
> Hi Christian,
> 
> On Tue,  8 Apr 2025 11:51:14 +0200
> Christian Marangi <ansuelsmth@gmail.com> wrote:
> 
> > Add support for C45 read/write for mdio regmap. This can be done
> > by enabling the support_encoded_addr bool in mdio regmap config and by
> > using the new API devm_mdio_regmap_init to init a regmap.
> > 
> > To support C45, additional info needs to be appended to the regmap
> > address passed to regmap OPs.
> > 
> > The logic applied to the regmap address value:
> > - First the regnum value (20, 16)
> > - Second the devnum value (25, 21)
> > - A bit to signal if it's C45 (26)
> > 
> > devm_mdio_regmap_init MUST be used to register a regmap for this to
> > correctly handle internally the encode/decode of the address.
> > 
> > Drivers needs to define a mdio_regmap_init_config where an optional regmap
> > name can be defined and MUST define C22 OPs (mdio_read/write).
> > To support C45 operation also C45 OPs (mdio_read/write_c45).
> > 
> > The regmap from devm_mdio_regmap_init will internally decode the encoded
> > regmap address and extract the various info (addr, devnum if C45 and
> > regnum). It will then call the related OP and pass the extracted values to
> > the function.
> > 
> > Example for a C45 read operation:
> > - With an encoded address with C45 bit enabled, it will call the
> >   .mdio_read_c45 and addr, devnum and regnum will be passed.
> >   .mdio_read_c45 will then return the val and val will be stored in the
> >   regmap_read pointer and will return 0. If .mdio_read_c45 returns
> >   any error, then the regmap_read will return such error.
> > 
> > With support_encoded_addr enabled, also C22 will encode the address in
> > the regmap address and .mdio_read/write will called accordingly similar
> > to C45 operation.
> 
> This driver's orginal goal is to address the case where we have a
> PHY-like device that has the same register layout and behaviour as a
> C22 PHY, but where the registers are not accesses through MDIO (MMIO
> for example, as in altera-tse or dwmac-socfpga, or potentially SPI even
> though  there's no example upstream).
> 
> What is done here is quite different, I guess it could work if we have
> MMIO C45 phys that understand the proposed encoding, but I don't really
> understand the dance where C45 accesses are wrapped by this mdio-regmap
> driver into regmap accesss, but the regmap itself converts it back to
> C45 accesses. Is it just so that it fits well with MFD ?

The main task of this wrapping is to remove from the dev side having to
handle the encode/decode part. regmap address is still a single value
but if a phy is mmio mapped is difficult to support c45 since you need 3
different values (phy id, mmd and addr)

With this implementation a c45 that is mmio mapped can implement
whatever way he wants to configure each parameter for read/write
operation.

Example the ecoding might be on different mask and with the additional
function it can be reorganized following the specific mask.

> 
> I'm not really against that, it still converts mdio access to regmap so
> there's that, but is there a way to elaborate or document somewhere why
> we need to do go through C45 -> regmap -> C45 instead of just
> writing a mii_bus driver in the first place ?

This was askek to prevent creating additional ""trivial"" mdio driver
that would all do the same task. Since mdio-regmap was already in place
it could have been extended with a more generic approach.

Any hint on where to better document this?

> 
> As I said, I think this could work and even be re-used in other places,
> so I'm ok with that, it's just not really clear from the commit log what
> problem this solves.
> 
> Maxime

-- 
	Ansuel

