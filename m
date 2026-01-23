Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8106D778AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 19:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DvXfZlOozy6AmZQMM6N9RD72xpgXTKLHQJoVq/ukbsM=; b=qcED5q/jOvW87smI4ClRbHPCgg
	Ahw3tDZwthVYw8lATtJr3KNh9FcxdilVL1HbkRoqtqcqdJcWiMDJwwXgvl3UuaxGDOKBblCC1etDR
	sJYLG2nARqBH8iVI+Q9PIPv2POzWx6XmKiGGP6iHVi+CjHCZvz/Fx/qo8FftoIBwKSt62+pNCfr02
	aXBvgD7UIAmJL2h3nyP3EoMvTEBGpzlk79bcNY4nkUe0vSUhCXHETWjI/H8D2a/LApon/vhlU/SfF
	3DyRM2I1lmFb64ucUlhaMvK88RSh9O7Myd4GqFzVojl0SI2KkkNWbOHvxJbUlCTvkokyVF9la0GHJ
	9m2BK2kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMl8-00000009Q25-1pLR;
	Fri, 23 Jan 2026 19:23:54 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMl6-00000009Q0w-0Vhd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 19:23:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=DvXfZlOozy6AmZQMM6N9RD72xpgXTKLHQJoVq/ukbsM=; b=4p86AtouThwVJkVgaeajvN+sjT
	dBY779R8W1pYQJgiYMpAdNCUQAajUSfw9VfxG1LOP/8y+cd+wrPTo9W3jvAW3815Pkr5cqlxLNKoG
	jEKPuSPqTxUJeU2Ve0hyivbPB7kQmd8/sVxlU6/FzL5OTQqzzmh5FBM6bXGLAVqEdvzQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vjMkz-004J8k-7J; Fri, 23 Jan 2026 20:23:45 +0100
Date: Fri, 23 Jan 2026 20:23:45 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] i2c: xiic: remove duplicate error message
Message-ID: <76bcf983-30e0-4bbb-aaf8-a1763373484a@lunn.ch>
References: <20260123-i2c-xiic-v3-0-eb7cd4254dfb@nexthop.ai>
 <20260123-i2c-xiic-v3-3-eb7cd4254dfb@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-i2c-xiic-v3-3-eb7cd4254dfb@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_112352_180244_6DA0224F 
X-CRM114-Status: UNSURE (   7.07  )
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

On Fri, Jan 23, 2026 at 08:02:46AM +0000, Abdurrahman Hussain via B4 Relay wrote:
> From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> 
> The devm_request_threaded_irq() already prints an error message. Remove
> the duplicate.
> 
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

