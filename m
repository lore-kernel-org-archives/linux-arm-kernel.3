Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB20AC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 12:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=14fin0YJ6SbUZMWvdG1D118Ew6eotDwzI0Tc0US4E9Q=; b=wXwGbgNp7zz9FqubMyXUG0Nu6B
	aXvmTEdNVpH4UE7i+fF2M+/p3rIi5j7kljGuDWg/FN/ErB/zyKeQcxby70azE5wfgCZmx+gpf5tZF
	jlh9gtXQBMfDF9Th1Sy/CV89PypsQnBgN7Lb8nXoRD+zxdI99eHSVf+rnVHWU9gcgm8ScLjm8Nn0I
	k7pkWQJYTXQA5OW+/kMkbJxnrrFQaBCjhqFw/K+z4XHSiUjrNznLwvlSYOotqpjIagJPtTVP8hmEK
	6kc7i91ojTsKmEDaDJhG3t6M2kTfFgRgduKLu1fVy33WbfNKPC4oJKl4kTC1tXtT39MgVnVPLkV7t
	URkgemVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm9MC-00000009OTI-0kwA;
	Tue, 21 Jul 2026 12:13:56 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm9M9-00000009OSi-3X3f;
	Tue, 21 Jul 2026 12:13:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1CB341A1135;
	Tue, 21 Jul 2026 12:13:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DBFF860368;
	Tue, 21 Jul 2026 12:13:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9EBB711BD03C7;
	Tue, 21 Jul 2026 14:13:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784636030; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=14fin0YJ6SbUZMWvdG1D118Ew6eotDwzI0Tc0US4E9Q=;
	b=KNOrEGKtxLIsxrLlPvS1FYZxFOUJo0JD4Rm0f6TKarf5otCJzqTg0rkTgkw4qA4htQ74e5
	mgp5B5leS/5DXS5vNpPJzs9HDsqJKhDFuxdeaTs54ny+f+f5jXE6xCnup3WGB2ok24W9wH
	Z281zliEgQPKjJahSp6yleLjMjUS3ZfJSb912htQUgrURiZYOr7Q/yc0jshujlBSYFyeBy
	H63BhN86EzTR9vhUShamL/uszBoQCA/wql29baaRhj2mJD17rhDxoqQMIldKSvuWJ2vBfy
	W+Tkdyxu0YKT/lLuYadc4zhXVk6WSJTig8T/yu1Blew/npJH2HH31hP7S/ybwg==
Message-ID: <8d81d5fd-7c22-4ada-83a2-b4c7ab1711e9@bootlin.com>
Date: Tue, 21 Jul 2026 14:13:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 09/12] net: phylink: add .pcs_link_down PCS OP
To: Christian Marangi <ansuelsmth@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Saravana Kannan <saravanak@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
 <20260717065448.1498335-10-ansuelsmth@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260717065448.1498335-10-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_051354_026968_03A71C8D 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

On 7/17/26 08:54, Christian Marangi wrote:
> Permit for PCS driver to define specific operation to tear down the link
> between the MAC and the PCS.
> 
> This might be needed for some PCS that reset counter or require special
> reset to correctly work if the link needs to be restored later.
> 
> On phylink_link_down() call, the additional phylink_pcs_link_down() will
> be called after .mac_link_down to tear down the link.
> 
> PCS driver will need to define .pcs_link_down to make use of this.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

[...]

>  
> +/**
> + * pcs_link_up() - tear down link between MAC and PCS
      ^^^^^^^^^^^
should be pcs_link_down() :)

With this fixed,

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

