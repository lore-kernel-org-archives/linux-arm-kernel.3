Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E53C43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 14:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljs7RGaTifxfFw5bn73caHjn9tTVbQSLKh5eLK8il9o=; b=ZUCTb6B285zqTRD6lFtMbppG0b
	rbaPGmp6Nz4eV/JpcuNCjM9ANWJosul/U+GR1o0Zi7V/LfJgko/oA0mcBrXm3qrzai5u/h5vphyDp
	VIt7XQThscjGrokB0C7nujszF6nLamy2JH6VZ+Fa2SAKrNPQFNmjNHuUltozGgiYTBXOt+Tzs9yFk
	CIYhlGLKNcFi3RBtNygXNIGVQZaCBjdlVXZI/Cg1cCc/dpmW6tnR8U/WUzP3ELOh+bLLpK/+M8urK
	Dob4SelxqSyI4Dko3l+q5+42bMjvE9t5cxYJX7pQqSCyouKUmDh6k7YnKgziUw2c3Yv0N+l70aW1B
	POe+fc6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weChf-0000000EqdV-2uMU;
	Mon, 29 Jun 2026 14:11:15 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weChb-0000000Eqbx-3R13;
	Mon, 29 Jun 2026 14:11:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ljs7RGaTifxfFw5bn73caHjn9tTVbQSLKh5eLK8il9o=; b=ba9IDNG5qaNFbWiu8XAchmSY7m
	H6B6cvKMhQWm/IMhepYGlwO/sminRwaTuwNC8KnxE/eQq9T2JAkYRli3bDTmSTZlGpakGnAx2jn8K
	rpI80xwM6ZaTeTrrSNeZf5BpQdHsMauMtaeRbYFLZK+927daMOnNxGnPZlJide3yZp3g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1weChI-009las-3j; Mon, 29 Jun 2026 16:10:52 +0200
Date: Mon, 29 Jun 2026 16:10:52 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Wu. JackBB (GSM)" <JackBB_Wu@compal.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Wen-Zhi Huang <wen-zhi.huang@mediatek.com>,
	Shi-Wei Yeh <shi-wei.yeh@mediatek.com>,
	Minano Tseng <Minano.tseng@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [External Mail] Re: [PATCH v3 2/7] net: wwan: t9xx: Add control
 plane transaction layer
Message-ID: <92b1e341-31a1-4f60-80d5-ccf8f742a38a@lunn.ch>
References: <20260624-t9xx_driver_v1-v3-0-73ff03f60c48@compal.com>
 <20260624-t9xx_driver_v1-v3-2-73ff03f60c48@compal.com>
 <2a90ae6b-2b6d-4340-b557-915252cc3488@lunn.ch>
 <49939d4d682f4c1fb359973ea2cdbd00@compal.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49939d4d682f4c1fb359973ea2cdbd00@compal.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_071111_860868_5F6DEE7F 
X-CRM114-Status: GOOD (  10.62  )
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

> > > -	devm_kfree(dev, mdev);
> > > +	mtk_dev_free(mdev);
> >
> > Why are you removing devm_ calls?
> 
> mtk_dev_alloc/mtk_dev_free are paired wrappers so the caller
> doesn't need to know the underlying allocation mechanism.
> The devm_kfree is still called inside mtk_dev_free.

Two different issues here:

1) If you don't want to use devm_, don't use devm_ from the
beginning. A patch should not change how a previous patch works, since
you are wasting reviewer time reviewing code which you later change.

2) Do you understand what devm_ actually does? Since you use
devm_free() i don't think you actually understand what devm_ is all
about.

	Andrew

