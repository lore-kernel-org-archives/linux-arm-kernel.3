Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01B3106F30F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 09:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hS5roOvyydx81PJbwGqPizASjpTbJZlBKZMPMXDdDpM=; b=IYGbeBZ9smbUBg4NqeOxBGF4jB
	NiVULxAOiwXMrn6ucSmPLrkX2qjQXPgOf1ZmK7j7+HeWYhIM3IWQ6Uy8/m/1lIhiv/eGEFW8CR5Nh
	k7vEi6aKCsmmd6zyAigfdnWfAcD56ntSAs7QbKGlwwVWuXVOje6Vn1h2MwagXyiRC7WicCDAgSpQB
	ZnsBSlhQ4eWBsJZfj8I6VbHO6UISQkum3twlUUAnEEybDcHlpWTQeS95b2J8HX20z9XqfzdCxXyU6
	jPBCe5wf1xOCuG53SYEcBfPEi6wx3wMuMEeuyBjhNZdcDeiBz7SLBrseY/Kdemb7UYsGEH/GFwfk+
	3fXFFMdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gyX-000000058vu-19oZ;
	Thu, 26 Mar 2026 09:26:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gyV-000000058vk-3g8o;
	Thu, 26 Mar 2026 09:25:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E0DB060121;
	Thu, 26 Mar 2026 09:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9C4DC116C6;
	Thu, 26 Mar 2026 09:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774517158;
	bh=bBViXac1s1HzjQE4ZEPCOzLXVvupztlcldihSdx6tMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i5RrIUBC2At8KnYfWNO1JFi8v8xn8sSkf44BAPRC6ojGSx2VyKZwlkKfKm1JQBAvb
	 k2r3zEXC0EfN9gkUEpv5ibD50ts/pp9iC4LI5PuKrgc8R0aql5Uiu4h/BFH1EPxMnD
	 9ATo05H2ez3Hr74IbrQF5Jdi0QpIhbwNKzbxdCzk3ilzc0Oaj8MA/JPotqB2QNaBjR
	 TOzu72w+r0f8JZneXamUKOUYMXPdgh6sI3D+HzFILnNBT9AH1Sc9AOGG3WmOh8SIiU
	 a/B0qjMq19NwUUAJfRFTHZNdcprtseulF9a/6OB3TRT6UJZmNX/Xdev53dT0V9+fGS
	 qr8G+/M4q8xQA==
Date: Thu, 26 Mar 2026 09:25:52 +0000
From: Lee Jones <lee@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	lgirdwood@gmail.com, broonie@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, igor.belwon@mentallysanemainliners.org
Subject: Re: [PATCH v11 0/9] Add support MT6316/6363/MT6373 PMICs regulators
 and MFD
Message-ID: <20260326092552.GG1141718@google.com>
References: <20251027110527.21002-1-angelogioacchino.delregno@collabora.com>
 <20251106161149.GU8064@google.com>
 <701b6abc-71e8-43fc-adfd-211a62dbec64@collabora.com>
 <20260326053449.GA910813@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260326053449.GA910813@google.com>
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

On Thu, 26 Mar 2026, Chen-Yu Tsai wrote:

> On Fri, Nov 07, 2025 at 10:01:56AM +0100, AngeloGioacchino Del Regno wrote:
> > Il 06/11/25 17:11, Lee Jones ha scritto:
> > > On Mon, 27 Oct 2025, AngeloGioacchino Del Regno wrote:
> > > 
> > > > Changes in v11:
> > > >   - Removed unnecessary #address-cells in all mt6316 bindings
> > > > 
> > > > Changes in v10:
> > > >   - Added "struct" prefix to structs kerneldoc
> > > >   - Renamed struct mtk_spmi_pmic_pdata to mtk_spmi_pmic_variant
> > > >   - Added "REG_" to MT6363/73 mfd register definitions to disambiguate
> > > >   - Expanded MTK_SPMI_PMIC_IRQ_GROUP macro parameter names as suggested
> > > >   - Some rewording of comments as suggested, addition of more comments
> > > >   - Refactored IRQ domain handling due to deprecation of function
> > > >     irq_domain_add_tree() to use the new irq_domain_create_tree()
> > > >   - Fixed to use generic_handle_domain_irq_safe() to avoid races
> > > >   - Added support for two interrupt cells in translation
> > > >   - Removed .irq_lock() and .irq_unlock() in favor of lockdep classes
> > > >   - Added support for handling PMICs without IRQ Group register for
> > > >     upcoming MT6685 implementation
> > > 
> > > The MFD part looks okay.
> > > 
> > > Let me know when you have all the Acks and the set is ready to be merged.
> > > 
> > 
> > 
> > Lee, the regulators part was picked by Mark, so I guess you can take the MFD part
> > through your tree.
> > 
> > I'm not sure if you can also take patch [7/9] (auxadc binding), but it would be
> > great if you could, because there is an auxadc example in the mfd binding that
> > needs that commit in order to succeed the binding check.
> 
> Friendly ping. You might want to resend the remaining patches. Looks
> like they are all ready to be merged?

This is an _old_ set.

Please rebase it onto today's -next branch and provide a [RESEND].

-- 
Lee Jones [李琼斯]

