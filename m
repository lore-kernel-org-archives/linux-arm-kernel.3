Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30057D2F338
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5JX8I944vOf0miWVEpuB8Fx/vVescgzjqKFm8m4hKuA=; b=g07uJuINPchvx31hspsccxj40d
	Gqpi8uM7xDxF6amLUuVbUhzG5LCrUhHbhQH9vLVUYfF8D3mH5fJYwjCposwwN5KHEgyLCkNbKoP9F
	tWknhnl0WdjdbFieqa4MVILQh693riv6j2kIIo1r01bPjB+6OF1JAuEIq8A0Wmscyonzj23I3vW3o
	pDSRTOsuW7Fyu2e+kHFRv+EdUyPkHaCUbW5icNEAN6setivaCDi33NtJLZUAGfrD+SJpfld3SKmwg
	hHuws32BLktQqOSRfe8/K5sxHeOLNp2DAdQkFqWQo2dtO44XS9N8ONYM9tywT1lSGyAYJ5eHTbSnI
	9VOs03Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgHC-00000007MQK-1rIz;
	Tue, 13 Jan 2026 15:25:49 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgH8-00000007MPr-0n2S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 15:25:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=5JX8
	I944vOf0miWVEpuB8Fx/vVescgzjqKFm8m4hKuA=; b=HQLI2XHGlGdI3qVUbcVL
	GcW5zz9XUYHF5uREKFQXtzqE9GoVGLUBOiq55aDUSqtN+igGCQx2MD7bbwxif/MF
	je0czBWxOxexCGqFkSCREdnt2ucQtOhWlj3aEXLuxrle3uZLw5JMIFuWroEUwZ+Y
	d1V/9ZTIzJWeSMqbPqz4ItLhCrmG0cy0oDsmQuVpRuqyLiYYzpVxEGgKbs8niHet
	JvzFXgLzLRg6f8QSKMrZBEhye/09odcAZURWczfoKJuVqe6fvfinIOBVlcGBqvvA
	db9MWPeluBJ86qol16j40vZMufC9QI0i4Cb45B/w5yKFhYNtFh3ew5sCbmB3bkhL
	zQ==
Received: (qmail 1750804 invoked from network); 13 Jan 2026 16:25:37 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 16:25:37 +0100
X-UD-Smtp-Session: l3s3148p1@GtaBmkZIFJIujnvx
Date: Tue, 13 Jan 2026 16:25:35 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RESEND v3 0/5] I2C Mux per channel bus speed
Message-ID: <aWZj7_i-hnfFOmJ3@ninjato>
References: <20251202-i2c-mux-v3-0-877dcf478a9f@gmail.com>
 <aWSy9U-JFocPAI9X@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWSy9U-JFocPAI9X@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_072543_710202_945EA8C5 
X-CRM114-Status: UNSURE (   8.49  )
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

Hi Marcus,

> This series has been in its final shape for a while now.
> With multiple resends and pings on this series for the last four
> months, I think everyone interested has had the chance to review it.

So, if there are interested parties, please add tags like Rev-by or
Tested-by. Makes my life a lot easier. Currently, the core parts here
are unreviewed.

> Wolfram Sang, could you please take a look on this series and consider
> pick it up for merging? 

I do respect the work you put into this. However, I am super busy and
maintaining I2C is largely free-time work, so I can't give you any
promise. Believe me, I wish it would be different.

All the best,

   Wolfram


