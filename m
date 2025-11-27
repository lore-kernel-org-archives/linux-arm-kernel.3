Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0039DCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 11:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/UoMjP/VckMDFTPewZOgjdj4Y7FL2FytpfqcpwHcM1o=; b=P9x7iB8WCucCS4A6m4Rl+LUScG
	DIdhOwbL+R+PBANB59MA6W9o0mk9DGEpeH9JM0j3jC4MDaa0OrmKY2/CFxgcnMLuUbg1XjJEo4x+F
	kCUrnyBud8eq0gFBhf1Sn+47H/XXWmrkny9wdoXe0OFp0YY85HAca8DZk7g48xSKkQAsbtpCbk4HJ
	qybdhI8f+oCC+EQ/y22pbR2pwI7UlpGGV9RHo1KRkPsXXSgdHCWCRa7CxVTkk7l4uHRuLNRFRTZUq
	t07gxXsZ4BOteIEwQqaP3aT2TxV75dHZtPi53trvj09rFw+JJHtjO2k1/SBZT+tPoNq9X7lhuQA5o
	VCPVq6FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOaZF-0000000GVG0-3M0Q;
	Thu, 27 Nov 2025 11:53:45 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOaZD-0000000GVFJ-2B2F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 11:53:45 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dHFF55Y2Mz9sxm;
	Thu, 27 Nov 2025 12:53:29 +0100 (CET)
Date: Thu, 27 Nov 2025 12:53:25 +0100
From: Lukas Timmermann <linux@timmermann.space>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alexandre Marquet <tb@a-marquet.fr>
Subject: Re: [PATCH v2 3/3] ARM: samsung: exynos5250: Allow CPU1 to boot
Message-ID: <d5yeuok5pqn36arg2fxexhpspcjnsamczbbglarf7itt7wvefx@fjkexpoa4rfi>
References: <20251125-google-manta-v2-0-0f097cfff39c@timmermann.space>
 <20251125-google-manta-v2-3-0f097cfff39c@timmermann.space>
 <20251126-mysterious-pearl-cuckoo-b45d59@kuoka>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-mysterious-pearl-cuckoo-b45d59@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_035343_817601_04779908 
X-CRM114-Status: GOOD (  12.72  )
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

On Wed, Nov 26, 2025 at 10:24:02AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Nov 25, 2025 at 04:12:42PM +0100, Lukas Timmermann wrote:
> > From: Alexandre Marquet <tb@a-marquet.fr>
> > 
> > Add an exception to let the secondary CPU boot.
> 
> Please say here why.
> 
> > 
> > Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> > Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> 
> Best regards,
> Krzysztof
> 
> 
Okay, I will fix that in v3. Thanks

Best regards,
Lukas Timmermann

