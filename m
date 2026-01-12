Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C03C9EC90
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 14:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cPfe4+F1jIR6NngD7tHxvuqFjI5b1NGNvcVIx0XSAp0=; b=xLoPFLUwAmZj4xZK8FpZ0dErLK
	rlLQ3vtGwXVnQHi3hjzsZARikXKhmgQstw2cJfZ4RqwWMRWpIZZ5tNq9ce1ZDnt7GG28V241CTc1I
	pOVRqMkdNTDxJL2F8MpGP3YrUAURGltxjzjc1lxk5dl9AvVPJ1sJwOR669PdCuwQgrQj2wU4K/QBE
	Jc5MGR06/PxuNjQHtFZJ/ZmnDy6uldw0lhTUImrPxVLLZ93J7wxAI9JdNOXULEpzQIeL+puuZQTIC
	PoTsyvKS2lOagAGaeA5alKaMgghAtEETfVGRzitTCxpgCzHKboXTqUPdiBSLa5VcBrjM9ymKNRWcn
	srBhtrQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIdm-00000005Unt-0Q0K;
	Mon, 12 Jan 2026 14:11:30 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIdk-00000005UnT-07Hd;
	Mon, 12 Jan 2026 14:11:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=cPfe4+F1jIR6NngD7tHxvuqFjI5b1NGNvcVIx0XSAp0=; b=WO9meBC6JFVYzT9n+3xSr0vVLT
	zxcw1xSA/aMOBUhxNeM8GjHtiNSaNVSX0rpDYdJMmqBMI0BTS91OZb+2lWuHStidjEEgbkTIMA3qQ
	hmAmx3UgHROZE/SbnGgy995EQ1RlxddrCDCWonGcHwpe0LDIObLo+KpPtSrdIEGyKbGE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vfIdb-002UCA-HD; Mon, 12 Jan 2026 15:11:19 +0100
Date: Mon, 12 Jan 2026 15:11:19 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 2/2] net: airoha: npu: Add the capability to
 read firmware names from dts
Message-ID: <81f98b9a-3905-4bd9-80ee-348facefeab9@lunn.ch>
References: <20260112-airoha-npu-firmware-name-v1-0-d0b148b6710f@kernel.org>
 <20260112-airoha-npu-firmware-name-v1-2-d0b148b6710f@kernel.org>
 <f57867a0-a57d-4572-b0ed-b2adb41d9689@lunn.ch>
 <aWT4vcBzG6UnaqOF@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWT4vcBzG6UnaqOF@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_061128_084688_BD66496C 
X-CRM114-Status: UNSURE (   9.33  )
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

> > Why cannot this scheme be extended with another compatible?
> 
> yes, that is another possibility I was thinking of but then I found
> "firwmare-name" property was quite a common approach.
> Something like:

Having two different ways of doing the same thing in one driver just
add unneeded complexity. Please just key of the compatible like all
other devices this driver supports.

    Andrew

---
pw-bot: cr

