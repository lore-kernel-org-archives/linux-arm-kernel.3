Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C756CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 13:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8w/4mogQP7NjT3W1Df21Pjp1DKD/NsiEZgMQYQygdxE=; b=kIctVIEf7LYs/1MyYeP65PdFAV
	T/oigM9iYrlElZwpXrj5hPIcKx1gH9U1k46nAHdZ/QyRCNUtY8eWVNEDqkOxfBRVIFeLrBOvIsZ7R
	lu5Bg4ZGqVgyETTgVEJ75XQ1BlHt8tnAGZT3YdQ4zDnmwyceRQ8ZfZdpiFYxdQtdfPxm+EK1yXNH5
	gH1XneH6dWhu2yeV9Gs89sAVuOiocIr+8wt7OMDQQV5qRWQHrzSrKWafbo/BhviO19CK4xD5OQecr
	b+PqGCp1BPvjhbX3anpNHHL6zfcoYGgU7O/f8r2GoqKxdPDr45k7jTwVa1i5UHP3nlVT8fkMieWp7
	+FY4dGIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xERND-00000002VYs-3C0s;
	Wed, 07 Oct 2026 13:07:55 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xERNB-00000002VXx-1gmH;
	Wed, 07 Oct 2026 13:07:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8w/4mogQP7NjT3W1Df21Pjp1DKD/NsiEZgMQYQygdxE=; b=bsVEMzM0Sv/E2aebn1rJLn6sNv
	MHp3d7OXh7rqbnXFnR17Fo3kl1yRMwzXEIzSETJ9y5TRHpCSo0lbqhL17WdAKZOLsBfdF6rGvpakW
	PZN7g07PJCUm913G1LhIzajk1wJER8Azlaw8PsfveBRL3Fd1vBvGvyC1526+mJIlEcuo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xERMy-009Sey-Iy; Wed, 07 Oct 2026 15:07:40 +0200
Date: Wed, 7 Oct 2026 15:07:40 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Lucas Tanure <tanure@linux.com>, xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 3/7] dt-bindings: net: amlogic,meson-dwmac: add
 amlogic,t7-dwmac
Message-ID: <565e4b5d-4539-436d-8183-df183a9fde5e@lunn.ch>
References: <20261007082627.63807-1-tanure@linux.com>
 <20261007082627.63807-4-tanure@linux.com>
 <c70d918e-7944-4229-b997-7f07d924125a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c70d918e-7944-4229-b997-7f07d924125a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_060753_661626_06CDC64C 
X-CRM114-Status: UNSURE (   6.43  )
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

> > +      properties:
> >           amlogic,tx-delay-ns:
> 
> Do we still want to support the vendor property on t7 ?

No. As part of cleaning up the RGMII delays, this can be made invalid
for this device.

    Andrew

