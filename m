Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F90D41D40
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 23:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MryA6VSFHDjqh8alDU5GvEoeFh8bEKlu6n8pBlDOixU=; b=2r4eosnX+T9PG2xpiBOKyGlaZv
	tDxx4U8NajJ0CzDAFSfqhTU3nZG0Bq97iJ/qEzPHAb5zeJ0w2OGyArmK2CFB/40ORnn7GG/A6SgGs
	MVk9DKC5VUiZ7t8rPJAtk0iuHPFUPfOeB5r9aZ4FhTooQh1UUqtWZQEGXsEXKxuzZG/ZxKn8LAoiL
	EE8Xg0tac3kb3fLSnXxk2vPskD4lDl3BW+oWglXY8od07eB604Ku6IGzIX1yN3Rxz1NSOetXueg6g
	UrBOBoPSTi1kx2wWDuZ+2US8OPTX1v8jYO/WI+mIib0jYHN0EfotLkJ1Xl9mWU11CbcsvDyAYGU/L
	8hvtmwgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAeIU-00000001gJ7-1sNm;
	Mon, 11 Nov 2024 23:58:18 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAeGf-00000001g0s-1Keo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 23:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=MryA6VSFHDjqh8alDU5GvEoeFh8bEKlu6n8pBlDOixU=; b=18
	7e04cMD7Z6QrrTg8toFh4D4cJnnXj5/Duuel/TavF8d8UyiuBwfX9S/n/VPqDqHCVEQ1RUcYHOGH2
	HICcGyvhEjZkeWQmLorWtfibJl7rwymr9lg1nA6gvYXURvv6wM4sxm3c22IFsN1r+jF2U6zE2jMsO
	DX47zHvKjCsteA0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tAeGJ-00Cwe9-3K; Tue, 12 Nov 2024 00:56:03 +0100
Date: Tue, 12 Nov 2024 00:56:03 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Vitalii Mordan <mordan@ispras.ru>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org, Fedor Pchelkin <pchelkin@ispras.ru>,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	Vadim Mutilin <mutilin@ispras.ru>
Subject: Re: [PATCH net-next v2] stmmac: dwmac-intel-plat: remove redundant
 dwmac->data check in probe
Message-ID: <eea9bb16-305f-45bd-af5d-b14b715a9027@lunn.ch>
References: <20241111130047.3679099-1-mordan@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241111130047.3679099-1-mordan@ispras.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_155625_390066_272B7BBD 
X-CRM114-Status: UNSURE (   8.84  )
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

On Mon, Nov 11, 2024 at 04:00:47PM +0300, Vitalii Mordan wrote:
> The driver’s compatibility with devices is confirmed earlier in
> platform_match(). Since reaching probe means the device is valid,
> the extra check can be removed to simplify the code.
> 
> Signed-off-by: Vitalii Mordan <mordan@ispras.ru>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

