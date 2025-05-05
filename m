Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19D8C3ABB9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 21:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/JDVjbnRllxA5GgKDD1wAD9WzEbavQ9rwr0UDt7ns4=; b=jKapnbc/miuAGxrNyVFlhvKM7O
	uLIH5Jz5zzD6mdgauhoAde3iJwvLEz0je9ik+/q/SOQ5yQCx7wFvmK0EWDufDebM5e6xqR6veR0kt
	B9xAAOFtj/17KvMWBz2t0uO9+qH5bCZyJm8A2S6VOt0NiB/fdl04WM/T1DpXgWuiXIhFixVvImk05
	g3Adz1fJ+jdwFNilEu2Yof64fanT+mWEyCvDBGEO8nZwduUSxvxF11KSVXwLtGrmZWmb3RYnqyJKT
	UVPhmtq9/aFp0iVHDnhiGmTyq87VbFVq9kitLyDdzNmhK63tk4C0PMEq119/Zy6NWMDsTPlsKMB/r
	Mz+sY2AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC3Bz-00000008aUE-3vqK;
	Mon, 05 May 2025 21:17:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC3A1-00000008aHv-0KSa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 21:15:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2227743F7F;
	Mon,  5 May 2025 21:15:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42FDDC4CEE4;
	Mon,  5 May 2025 21:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746479736;
	bh=bC2rt61Zb2ctmnWbeinCpK12Ybj4VVtOuX9hqkSsohc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ivLOxa1P5oj/FN5tqsml2Mta07iSEMct5uNhn5JZcVesqvpih6+/va9RzMFXhvLba
	 380sHDSXmlsH9OP9xGSEuK691G5BsnE1cNYQiSEPRrGYTu1rIK99BlO171J5RacIOr
	 41ooZzm7Viuvhnse9gVNn3RfC4JyPwn57DkI8eH5LTP10GaVBu4HAFRvdPJ4l9GLry
	 7ZHUO+q0RlYkXyUTWotD/QjSLFDM+Qq+wH/Bj2ZK8VH3LrJBFJguPl3X2lXxsJ6lRD
	 MsmCIuasfTWpkTW63Mfb1FN8h48g0jwHG6GVqkh5snX7LqvCH0D20ffbJR7cxLE7YG
	 08MplxlBTK3sA==
Date: Mon, 5 May 2025 23:15:33 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: davinci: add I2C_FUNC_PROTOCOL_MANGLING to feature
 list
Message-ID: <y4awvwoqshcyvbdlu7ibg5t3vu4rnsthnb2srrug6qjcfw3mq4@5uzqb4tkox5o>
References: <20250326-i2c-v1-1-82409ebe9f2b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326-i2c-v1-1-82409ebe9f2b@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_141537_146252_3947DA02 
X-CRM114-Status: UNSURE (   8.19  )
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

On Wed, Mar 26, 2025 at 03:39:47PM +0100, Marcus Folkesson wrote:
> The driver do support I2C_M_IGNORE_NAK, so add
> I2C_FUNC_PROTOCOL_MANGLING to the feature list.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

merged to i2c/i2c-host.

Thanks,
Andi

