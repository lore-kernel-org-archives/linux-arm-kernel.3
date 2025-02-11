Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BCEC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 10:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cFv1VxMytVdzhDVCHcUlXFbWIHkW8d5aXU+QGs58moY=; b=e71cnTeA2G4DRJ
	I+Yrm+lbPWOrqxEUa1VhNT6lS+kh5ePIJOsGeDpeNvpxcZXcQRs4ihoiNETJdnf6whbb0HmkikZss
	eESCy8AJEEanh1K0mom1SqKlSbvZRUSxyVAnewoT13P9vgtKp7u1dso2HRPlbKGcYUtRVGgEOcqze
	uXF0tg5XNLa2VL6Xcyeo8HEOcQ08OMCbKC++SogXNm5OOgliIArw9NVzQgj9Lp8k5tItv4iIpU92S
	j3uZk8zkYaXcdbrXUfHcw1uhHcBQcPEhwC5eUPWXFSkxZvb6BF2oGsrN7cu7KEDzuKsbasvFq0pVs
	hL4hnnw4JS0eSwbTafpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thnR7-00000003LBW-1Tky;
	Tue, 11 Feb 2025 10:24:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thnOT-00000003KbW-3odP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 10:21:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 999F6A40185;
	Tue, 11 Feb 2025 10:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF148C4CEDD;
	Tue, 11 Feb 2025 10:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739269288;
	bh=5x60nY8sN9m85bsl7snncFeqJyHzcSnNTeHckXMLF1w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NlER+ZpBIywV2hH4NLYcyQqtdA2ZIWMZZYQDbRwYH53hyWe3tMs1io+rHfUdOCu0c
	 rpALDU5pNw+xGeOgXRHto4Aj/PnWVDxdSu1pyBFgyKVpMZFA+G1Zn8VMY3SLM/4d5S
	 VNOiuqvZ8wvmTXl5O2ABqSYvS6yCLmLP4E+ySudTr4GrtQnfNP8zXcJal6I0z/Lxd4
	 NQLHxX7HRvaJiICWvCkbJFAbuQHV+etv1HfELOGjfuG33Vjdc02QoslRC1hTJZl8XI
	 AzMtXKzEaFFNfhHhyWRxgWDDI5vUbSEv2Vt9wEhC6SXPmGepCDOJBHclNYsO9cR3p8
	 IjdtD+rnJ4C6Q==
From: Lee Jones <lee@kernel.org>
To: catalin.marinas@arm.com, will@kernel.org, lee@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 arnd@arndb.de, Robert Marko <robert.marko@sartura.hr>
In-Reply-To: <20250131171739.1044701-2-robert.marko@sartura.hr>
References: <20250131171739.1044701-1-robert.marko@sartura.hr>
 <20250131171739.1044701-2-robert.marko@sartura.hr>
Subject: Re: (subset) [PATCH v5 2/2] mfd: at91-usart: make it selectable
 for ARCH_LAN969X
Message-Id: <173926928672.2065569.7282528185747912475.b4-ty@kernel.org>
Date: Tue, 11 Feb 2025 10:21:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_022130_020803_E5F9CCFC 
X-CRM114-Status: UNSURE (   5.45  )
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
Cc: luka.perkov@sartura.hr, daniel.machon@microchip.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, 31 Jan 2025 18:14:10 +0100, Robert Marko wrote:
> LAN969x uses the AT91 USART IP so make it selectable for ARCH_LAN969X.
> 
> 

Applied, thanks!

[2/2] mfd: at91-usart: make it selectable for ARCH_LAN969X
      commit: d075bed61594009df64055630af2e8754fc95b78

--
Lee Jones [李琼斯]


