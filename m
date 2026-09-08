Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761C2C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 08:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJh2MhdLa63Ttm1UiskqgHeI5PnKcOO9wH8EfHh8qRY=; b=dI6NATxU+F16FxWOXdIKierjDb
	5NSGPzMjOGZdHv+yu9+9dYQ92KMFEwQMlAGZjTqO1sIfxKBtSfOktSfoOZRCXYoEUXbzcbvF7Ucom
	3LPF4OQFuc2eljABw5emoLDQ+Bh4bHqqCXOXFV5YLxez4uwd+zb5M2iaEaval5KlfZpKoo0HR0P5R
	enYYqFUnhkF87RT+m+F8wWjUjl9AsKTECzB2Ftzw6Dbruobr7h2ZRsUYNZ6tX/D7am2f07cQT7IY3
	zhl6lVIrHhjYxJNpn3fti4ISFp8dqZ/mMEzukV15gXGoNipjgNySe8TTd7q0nTYIY4cGjkQINbo41
	Db2RSiRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qpI-00000008LIo-2Ovu;
	Tue, 08 Sep 2026 08:05:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qpG-00000008LIc-3j8u;
	Tue, 08 Sep 2026 08:05:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 283F543A59;
	Tue,  8 Sep 2026 08:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6DAF1F00ADE;
	Tue,  8 Sep 2026 08:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788854706;
	bh=bJh2MhdLa63Ttm1UiskqgHeI5PnKcOO9wH8EfHh8qRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T79nZLeE+MVQkkVQxP9ZC5GbaJPNSYzCCObJMkr86s5FAmSJwWsKWyDgBG6bJrtZr
	 KhLZNUrzDCtihT/T+SqIKKECtWJk13iY3sbu6Ddt1Pyhk0fxAj/X3/kXzP3H1YJWpV
	 0WXUR7qDhNbVuHk4z2/OJRIDoBpOPz1EYEkp+UjkmeH9yfyIb/VGrrNFmEgwutuddQ
	 EJHJoX4OC4IXHW+WsvVv/OaC/dOoDUObw/pGQihOCxKzrDrVZ3eurYe8pmfeq2GkHA
	 yhZZHNrYchon4fIfcG6sfHEIh6/QTeahbY7/DRMNWAaYy0BAsntnT/nK4sa2aiW7GZ
	 3UNgj54YJNDsQ==
Date: Tue, 8 Sep 2026 10:04:58 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-phy@lists.infradead.org, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, "open list:ARM/APPLE MACHINE SUPPORT" <asahi@lists.linux.dev>, 
	"moderated list:ARM/APPLE MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] phy: apple: atc: remove stale kernel-doc for removed
 struct members
Message-ID: <veg6ies4ob234g3gerxzvnlfxwcjlle7sarkbzp5ptycfljixe@2kgokqw53ncw>
References: <20260608053525.12354-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260608053525.12354-1-rosenp@gmail.com>
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

On Sun, Jun 07, 2026 at 10:35:25PM -0700, Rosen Penev wrote:
> The @sw and @mux members were removed from struct apple_atcphy but their kernel-doc entries remained, causing kernel-doc warnings.
> 

These members were never present. So 'removed' is misleading.

> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

