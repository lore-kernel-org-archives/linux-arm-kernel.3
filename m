Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AD1D68BFA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Nov 2024 13:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FnDq/5jDtvRz9wvJUkiQLKbNnaCYIlhSUV3JJFbTe6Y=; b=0G13UB6SAYgHACo8TTrF96LChG
	8hH9jz7d6/t2HoPvpfzdwT3L1dYQoposwsfts+dmzg9jFB+p0AbCPTtmy92UJwWzIgQ+X1JewmNIa
	Nq/Q6dnwiekftN46fWBGd/9wLTZ1G9hrjvagStuKnJlSysd7ewMZU0iNqVdw7dj/vrHib/ftrxeXO
	Y83Vv71D5cFxA/nbUkUzrcqHha66i3wTWcfepJdWZNqCEJJusJNmIMFaeZUN9rkOdgO/Yi/VSaHGq
	1BVoCFNT2q+8y9wGFwUKWZB1xrrx7wkK1fshZaQYMM9kaJGpu05Lawr3Ko84FEkD4XFOcuiUHeSGg
	JuwnXSsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCfQ3-00000007OiF-1ezr;
	Sun, 17 Nov 2024 13:34:27 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCfNX-00000007NyR-2BG0;
	Sun, 17 Nov 2024 13:31:52 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-431616c23b5so18420785e9.0;
        Sun, 17 Nov 2024 05:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731850310; x=1732455110; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:to
         :from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FnDq/5jDtvRz9wvJUkiQLKbNnaCYIlhSUV3JJFbTe6Y=;
        b=kEYJDQXNRGXjB4h54lGsnqQM9vZ7BCm4zTRVo5PbsidS1RrQ11PrKYXHgqY7NniZW4
         LTrU16uplKrRzKa+dn2v+aPRG7vLjEAW95fuu6ZU3SnEPPma+35FBotgC6aWuGt2he4+
         h0Kles3FGH8qcTHsIP4wN0Gb6dUN9kxo57Dl9V8H0MxZHoQVIDULQD5zSd9QDyedMn5H
         +DeRQulV0/cysk40iBWilwspCCXmSFKl2Sp85wWpqNxDx41pvUPFAso/wh3PjodhGb8v
         xjOayGOFSJeF87CmU/+PZNYYRrKGmc8TuAaufuwaRoDjmjgv1GjJPbjDqLNw8c6UpgjB
         oFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731850310; x=1732455110;
        h=in-reply-to:content-disposition:mime-version:references:subject:to
         :from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FnDq/5jDtvRz9wvJUkiQLKbNnaCYIlhSUV3JJFbTe6Y=;
        b=BDStE1s2Ycbsokkagqly2W7SafNcEL7xNIkMGWgZvfjlW9ivTfVFvMwQ5xooEGS2Lf
         VyaFbd0KK0+OAkWUiaIsfCqbe4fNhFhye3Zt2hg9gG5k5BH8M9r7mFvGuaIvvwL8AO4h
         gL8LVwC2tjZit5YIOGSVuPU+UMm31ESY5qYwRhg9qbeQ+saDnXBCAchRmiipEPKP0s1M
         XWLasNd4lKsseCjVt0PUhoct4o7WmtYPfKCeD9yX+G0Ur87FpOGa9ZpB/gtdl/l3gs7T
         RUhf8orC5CaKwxYGM+j2cZWfMLKuN7pIaBlPxOySn7B0wWriO13En31m7Y63JIraN0up
         bB+A==
X-Forwarded-Encrypted: i=1; AJvYcCWE+bOrtQOzqQosLD65Odu8mtmJzUnbKLAFt9Z+T/2B30YlOTqur1EJCP9t4RNx2Gjk+qA62MkL4yqSQLvD6Vh5@lists.infradead.org, AJvYcCXV+bVcePILtzA5oqp+QUI3gkWafXg25jxnPIy3h/JxMUb/WLC5rYhBjKWTtsJLMbxBG7CtnfXNbXl3d8mq55w=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwn51RTJTIsDuhRrJmQ4wwjBm1z2a3vjpVJ1HbXnT5UMAgXuu1
	mIuB7+KSh+1zsOyVNQYtl38RWvH2SpmDzKJVZ5jIXmtQ3gbCeU6i
X-Google-Smtp-Source: AGHT+IERyxnbD4p7iEZ9MOnnFKigJwdLcKzUPk6eBLQKFq6MYktdFTsmEMmPRzYPWbmoKwroTD4JwQ==
X-Received: by 2002:a05:600c:548b:b0:42c:b54c:a6d7 with SMTP id 5b1f17b1804b1-432d9767d80mr126959115e9.14.1731850309608;
        Sun, 17 Nov 2024 05:31:49 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da29978dsm122010285e9.41.2024.11.17.05.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 05:31:49 -0800 (PST)
Message-ID: <6739f045.050a0220.3b85cd.5d42@mx.google.com>
X-Google-Original-Message-ID: <ZznwQRSsOT3CnD4v@Ansuel-XPS.>
Date: Sun, 17 Nov 2024 14:31:45 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
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
Subject: Re: [net-next PATCH v6 0/4] net: dsa: Add Airoha AN8855 support
References: <20241116131257.51249-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241116131257.51249-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_053151_560098_A7556CAD 
X-CRM114-Status: GOOD (  13.19  )
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

On Sat, Nov 16, 2024 at 02:12:45PM +0100, Christian Marangi wrote:
> This small series add the initial support for the Airoha AN8855 Switch.
> 
> It's a 5 port Gigabit Switch with SGMII/HSGMII upstream port.
> 
> This is starting to get in the wild and there are already some router
> having this switch chip.
> 
> It's conceptually similar to mediatek switch but register and bits
> are different. And there is that massive Hell that is the PCS
> configuration.
> Saddly for that part we have absolutely NO documentation currently.
> 
> There is this special thing where PHY needs to be calibrated with values
> from the switch efuse. (the thing have a whole cpu timer and MCU)
> 

Totally forgot to fix the devm_dsa_register_switch export symbol, fixed
in v7. Sorry!

-- 
	Ansuel

