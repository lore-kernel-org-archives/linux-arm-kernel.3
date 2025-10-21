Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A00CCCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 02:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tVtJmqp3yt+dz1DmG/DL8I90hRNLVVHh90X02kG4VfU=; b=YXpdDMrDoAbXCzVsEiLZvUVHYU
	7zvS5xNzySJTuu/Xl8DapHhxT68ISVEDwD6OWP+bN5wKxHrBhQ+i5RrUTvIlqFjBVHIWIscfcNtgo
	QGxzMwitIfVqusEQojBL571dWDORLEFl+x3zkR2RzUYx+WYt6ui6RN8FW8MtTwURiCLbzjz8vQbUj
	0LqivF0Cf7mR1f4hEGJO6Xocvi7u7Nm+bO7HG7ZcE09JGZNq4USL2AZQ0Jlcu1G/ttdnngB7p71Qv
	UHNmLipZ3jxQbdXdPliUz4Rwow60qEkjXQRE3Y91pCUFnI8cSnlpNw3I0kX0y8JP3r6XarwnSCU81
	WJZSc5cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB1y0-0000000FYWO-1Dm4;
	Tue, 21 Oct 2025 02:19:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB1xx-0000000FYVD-3qxM;
	Tue, 21 Oct 2025 02:19:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 51EDB44E78;
	Tue, 21 Oct 2025 02:19:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E673DC4CEFB;
	Tue, 21 Oct 2025 02:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761013153;
	bh=GB7X+plXVOgL1XCSblZIKjmqfgsgXGvSSQmBrLyjZDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FnWjqXCM5ds+JJr5wqcIYzHLk5Nvvo2bCAKBRHurgiCXroK6LqQUBVbGNNsmtnwH8
	 pKrpDz5uYO/8i7OyzIQ60KVDYtwqEM1OJ+MO4KEwUFRh2aP3OLyBEfeuk7/FxLNu4y
	 gHk2WOYpbeabCbiMNselBBplwhmmCVrCAxiezhmbEG+CkbsRRdu82mp1LIc+5eqCI0
	 90Pw6L3Af6ucfdEoib6lDgOBEJP2idMEVmhAumqCsUachglgw05RFtz9UY1L4ZcEFY
	 2GAFV6r4g7CG8olGp/diqUK9aHTGnaC7XFhhUDMvYwMpIGufPwubzHaeE1ToJKaqUH
	 Xnua4NKRjcgTg==
Date: Tue, 21 Oct 2025 07:49:03 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, 
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: Convert actions,s900-pinctrl to DT
 schema
Message-ID: <sy72qccedkudtndyfg43mra4vrlctxjhgv5nkzaw4ojeppiisa@7a66eblvmlxo>
References: <20251013191218.4136673-1-robh@kernel.org>
 <CACRpkda6y0anNZ0dCHf_OQp-2q1g9LfXWqWD7mS44L1rYsZKDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkda6y0anNZ0dCHf_OQp-2q1g9LfXWqWD7mS44L1rYsZKDg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_191913_976058_D7B92820 
X-CRM114-Status: UNSURE (   9.20  )
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

On Mon, Oct 20, 2025 at 10:56:52PM +0200, Linus Walleij wrote:
> On Mon, Oct 13, 2025 at 9:12 PM Rob Herring (Arm) <robh@kernel.org> wrote:
> 
> > Convert the actions,s900-pinctrl binding to DT schema format. It's a
> > straight-forward conversion.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> 
> No comments for a week so patch applied.
> 

FWIW,

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

