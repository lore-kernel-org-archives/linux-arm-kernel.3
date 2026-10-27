Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9AE606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 01:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3Xo1lgqD;
	dkim=pass (1024-bit key, unprotected) header.d=iav.lv header.i=iav@iav.lv header.a=rsa-sha256 header.s=zoho header.b=cpnVcb0t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lTMF+Ye/9ru0PwM1rkxYWIfp6fw7+rkFRN5JrEh61e0=; b=3Xo1lgqDQ+06VX
	Z8tLR1U7P7WTD9VTm/gPVNBFy9hC39tb2Mw4hzi8nKOcir19kMgipvkhf96Shs5FaNPy0cNS+BybY
	cEiWsaQPszqs4ftuOBl4+GIvdGPrtXD8zguc57yWYLP6A2bFtmAAnuy400jhBcblKg08aGS+hGAkP
	N4YsdZVtIBl47VCnRa35vzgSlBcc82ZyjN8l9+qnw1wMyFClWeckh2XOzr7i/Zg9lQ8qaiaZyK6ro
	/r28LC2GvFGKS5mZATMaqDewrLRRHF4ion4Ey1rRGFXLL1sYleWC5uqTgDHXZoBUTeef+iZTb9z9R
	sa3DA2sWOKSUtYN9B0Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLVmr-00000003aIA-31fW;
	Tue, 27 Oct 2026 01:15:37 +0000
Received: from sender-op-o15.zoho.eu ([136.143.169.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLVmp-00000003aHW-1GoR;
	Tue, 27 Oct 2026 01:15:36 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793063722; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=DMZCR4pSyeWgpcpL0bBp/FA5mjRDuUidhoTxldiINgrXg7V138YfbklFljmziWe3/N+pVxD9M9zQqyEbpFXV7bF9GIRODRXnvGZvTHRPDODNqhny/I3O2wIIu4DlzKI3JetYMK+/dD/mFdJ9jZIshPUxGwWNT6kRmxK4GnQKHg4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1793063722; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lTMF+Ye/9ru0PwM1rkxYWIfp6fw7+rkFRN5JrEh61e0=; 
	b=PTNCU1Ri48ndRN3JR301KsTY2Mu2fnTX0kUt5uAj1vXOHqko/0lytAzYoUa5aqVZrqwDhHpsdDf0MgiM7T/G53LT+m6ClChDtBWk5cTo/XAynZtViuJyXNLwfM/wBZK0Ua15C1stsyzl4t0kXOi2ZK349BkRiPnvVH3C3tRB71E=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1793063722;
	s=zoho; d=iav.lv; i=iav@iav.lv;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=lTMF+Ye/9ru0PwM1rkxYWIfp6fw7+rkFRN5JrEh61e0=;
	b=cpnVcb0tbEmRGZcpIVyDqvqRfLgdIg+lWsSYKzMGYoZgeyvVwiDHjmTvvnjbg8/g
	1t7yjwmCGzUY4TPtv79X19lX6NYxv3ZrX5qfFz/PoxkuZ0yMF9FvWGOKi9agtj0dhsC
	C+qjrllJAeI+9sMGQsc6kdbUqkrPtMS6nqTx4zPA=
Received: by smtp.zoho.eu with SMTPS id 1793063719788794.024080307071;
	Tue, 27 Oct 2026 02:15:19 +0100 (CET)
Date: Tue, 27 Oct 2026 03:15:16 +0200
From: Igor Velkov <iav@iav.lv>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH RFC 0/2] PCI: rockchip-host: Retry training and hot-reset a JMB585 on RK3399
Message-ID: <20261027-rockchip-pcie-shawn-mps-1@iav.lv>
In-Reply-To: <ff204558-dc22-4d38-b0dc-2c727f983f9f@rock-chips.com>
References: <20261024-rockchip-pcie-resume-v1-0-58e54a5cf5f1@iav.lv> <4316c1da-f7ff-4fa5-a330-512800474e45@rock-chips.com> <20261026-rockchip-pcie-shawn-reply-1@iav.lv> <ff204558-dc22-4d38-b0dc-2c727f983f9f@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_181535_622662_67C37354 
X-CRM114-Status: UNSURE (   6.30  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026/10/27, Shawn Lin wrote:
> I have no idea about it. The PCIE_CLIENT_BASIC_STATUS0 says:
>
> 14:12  	RO  max_payload_size
>
> So you are saying different MPS in different cases, not linking status.

You're right, thanks. Our two reads came from different points: the
slow-link one before host_init_port() sets the MPS to 256 bytes, the
other after it, so bit 12 says nothing about the link. The link-up
time after the hot reset remains the only signal we have: 2.9-4.5 ms
fine, 10.9-35.4 ms aborts.

