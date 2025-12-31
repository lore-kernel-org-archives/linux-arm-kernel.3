Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B11DEE57D1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 02:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3W1pQwtPomYLv+B1QnhCew0dw49YFzS4orHruXWjNuY=; b=gWQYeF4pl8oxJ9LETiOlI7nfZt
	wspMrCm7h1PiSY+VPhickjaUrjOp7PsA7Jh8/LVJRxD894ENkA0W/8WMBM0jlWc3mMbEQJ6GpKG5w
	53S50hBSOh+/Cy5tCNERsl8WFR0ea+eCw3IexsiJoliN0fz8C6RDlaT3WjGfz9yRf1bsuVYuEA/RU
	ReCAkF20rqOk8FGOXaEBXcVWyKXhy9q9dvD8axbh2jL466bdvMH95+xuddO7z2majDsFMjD3j70O1
	qyWGbRvm281a8QO5IVtIiLmYvnhnWDa29NfBEVobXwtWL4pdNdOef6NWeiXzulZILrtCf0VhqkIQq
	OcNPRLCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1valnB-00000005ZKX-080f;
	Wed, 31 Dec 2025 02:18:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1valn7-00000005ZK2-3RHz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 02:18:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1578C41858;
	Wed, 31 Dec 2025 02:18:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CEE2C116C6;
	Wed, 31 Dec 2025 02:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767147504;
	bh=pRWn7rpvOpmSzAKdEiA8vbbyCFJU68TB0Ux+WK0H2BQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TApW9ab9gCZrjhqfr+HCK3YzhyrgTmM+8Ow8r/d9S9I5fWmHLIhWMY7VejEvfgNhm
	 ciYsdC9wOzZmW23lqoMZNUorAS1n0XW7raC36zW6lXhPptVPqB8e20C8hmkqNO63z3
	 zD280rUCKy7wOnQgIMH9i8Z0l9G9Km+3Jtn2aGrkVcJxTJQGJosDhhHshCUBsDg4C2
	 GvMPZCG/b9DNQXIjivNAQUpu5QJLLS3LWUxmoq4A+AtVe+rMaU8MsWNndwOAD/M6K6
	 rXX3n+kRYoZ8WKdeKnsBpgG2Y4hNk/x9MRtU5NUZPxcSdrq6/EElnHduWI5Se9Tppw
	 oh/4vkG8fH4LA==
Date: Wed, 31 Dec 2025 10:18:19 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, festevam@gmail.com,
	imx@lists.linux.dev, kernel@pengutronix.de, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org, s.hauer@pengutronix.de
Subject: Re: [PATCH v2 1/1] arm64: dts: imx8mp-evk: add camera ov5640 and
 related nodes
Message-ID: <aVSH6zOaXqmVfwzq@dragon>
References: <20251229163101.4004478-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229163101.4004478-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_181826_175007_9CDD25B2 
X-CRM114-Status: UNSURE (   6.28  )
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

On Mon, Dec 29, 2025 at 11:31:01AM -0500, Frank Li wrote:
> Add camera ov5640 and related nodes.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

