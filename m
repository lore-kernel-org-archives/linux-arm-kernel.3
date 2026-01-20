Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5A0D2ED14
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 10:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0xuVmHZ5HB6mdYDqyzYB2LKTzWEE7fIoJdg+ENYqUA=; b=n4/OC1s8h6APDzfNKpDMq5G38d
	Dtyt+tkKIhSTnq/bcO1KYNPt2/XFqxSFicIFOQnhT+WeU4KnhzHzV7dVOmC2hhsUBxN4AMQgMrke5
	9eUQptI56Riu+nUc/Y3BhJHjNkZZas+l2AEb/EoOMzGCa354QXdK716DOhbsmdPr4wnpWqhPKOQ0/
	eiJZtTFxXat0oJi7M3X7RtaFE+Fr1uEY6LSJYijB6ZAw1EIa+pkli90fHXx5bi3aJCRbVJDxPGEgt
	EYi1Ut6eY2+fdBZwsncsHxA33p918Rj2kZqavonxLUCIh8AO38VcTbPBoKyqnh1L3xsI+5Pfj2/Xj
	HfZA94Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi91J-00000003cyU-2Mf4;
	Tue, 20 Jan 2026 10:31:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi91H-00000003cy9-2KPH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 10:31:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA18841A4E;
	Tue, 20 Jan 2026 10:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FFE6C16AAE;
	Tue, 20 Jan 2026 10:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768905090;
	bh=bJN0DSC6Ua6pKsP/DOPJJOTlRRY5NsWRrEymD+za6QQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QnLBqnYCradIChvnsPAVk/kjMSoR0YsDiYIOor1O0d9cH9wbEnXp8CTydAOCkEgXu
	 Bvz8+eDdEFeE51Gcr6zRaGUmcEL23vGwDrATnru+LbA/emXS9oybE9d7RjiOm+y2M2
	 eEVdL+vllEgtoNTtKpbjgldvtggYDbX4IqrZMTTHaOBe2zOdfvI44O0bfj570y/jps
	 W3UuGYSyRzFBPkAP+3/apHuoq0rZgsoqRgpWnQkt472JPPtUTrJ/UbyfbyFfULhRLU
	 VWgllMGl6qeUHxoGl9+KZYH3wEDHWWR6kLgMLXDfrJYYcdRUVe+t9dgSyTVCQpvRS0
	 KerF2z2I0oooA==
Date: Tue, 20 Jan 2026 11:31:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] ASoC: dt-bindings: fsl,audmix: Add support for
 i.MX952 platform
Message-ID: <20260120-fractal-lemming-of-chemistry-6f21df@quoll>
References: <20260120035210.1593742-1-shengjiu.wang@nxp.com>
 <20260120035210.1593742-2-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260120035210.1593742-2-shengjiu.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_023131_633772_AC916267 
X-CRM114-Status: UNSURE (   9.88  )
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

On Tue, Jan 20, 2026 at 11:52:07AM +0800, Shengjiu Wang wrote:
> There is no power domain defined on i.MX952, so make power-domains to be

There is no defined or there is no power domain? If the first, then this
patch is incomplete. Please read writing bindings part about complete
bindings. If the latter, then you miss constraints ":false" and commit
msg phrasing is incorrect (and remember that in such case you won't be
able to add power domains later because now you add complete binding).

> dedicated to i.MX8QM.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---

Best regards,
Krzysztof


