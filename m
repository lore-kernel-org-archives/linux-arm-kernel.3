Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF4810706CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 11:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RY1qlqhW38ib1A6niPM9r+Bwm79lUV4w6e3bFEBYkGE=; b=TF4B6djnRoRpqyf8dsON026uuF
	CzsRc9JWzrWgBrtbJAoc9X1JxQn4EncDZiX+bZR9Wa+Thb2QfGkTKTceLxt4XvC+6PKAAcI2LJUks
	lznMV3lw6N/j+1vQ4ztC5D0auHtHY1UKeaGw+2RKJh8eDCpfWJJuJrI5ukYhVSth0F73mzrgBHBLK
	LVZQeCKJde6rx68U8N65xpbSBYqzwuuvSMN9+9xQZfmCXNXA9tVRu5d8phZ6l7TqclWdznmFfZ4KJ
	vMdMssa4pW9V0EZ4Wv8qXNlpH5iBpKlrT+zLQxErgcAljiMTPCwSQPJAb1RNdP+jVWy9WRM/no+Xb
	84htPA4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1MsL-00000001lYh-0cVH;
	Sat, 14 Mar 2026 11:09:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1MsK-00000001lYT-1VVQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 11:09:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A8F260008;
	Sat, 14 Mar 2026 11:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAC44C116C6;
	Sat, 14 Mar 2026 11:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773486583;
	bh=YlEyIcFGjh0GIEgUBI/sL06NVS7FD4Z0AvbOPmvJT28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BaRWg38Al81OiGCzfASSu/9rEd1DeGXqI+UafyXX2ylI7eUrg5gpMSQLYtYLK60Wt
	 di+UOvtq4aABLxy+M1wZSi6mNURAeFlFpJotEsePrCylmE/MFhabj5O0UrgHc8/2HM
	 Az8ilZlwMQp6XK6A5vz0IElR5KVZUK+/3RQnBqt/467HN4h9/qmpDa5jD6V63/dvR/
	 YVK2w8N/o9I7mY/YZh/VFxh/vY9GKRCpr/0sT4JLmdFtZvyBi4pr4AP0y5UODXQA9c
	 1CHZIAXirdcAaSiHk24irfKrFdRKDjKKzdfkLCHxknuOeFvjbHnic8Bc3h4B7DkYGS
	 gvZoc4Nsvtiyg==
Date: Sat, 14 Mar 2026 12:09:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@lists.linux.dev, Magnus Damm <magnus.damm@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL 3/4] Renesas DT binding updates for v7.1
Message-ID: <20260314-quick-gray-saluki-0f96ff@quoll>
References: <cover.1773399669.git.geert+renesas@glider.be>
 <cover.1773399673.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1773399673.git.geert+renesas@glider.be>
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

On Fri, Mar 13, 2026 at 12:12:59PM +0100, Geert Uytterhoeven wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v7.1-tag1
> 
> for you to fetch changes up to 3ac4e6b92fc200e047d13aae06224b2a72539b9e:
> 
>   dt-bindings: soc: renesas: renesas,rzg2l-sysc: Document RZ/G3L SoC (2026-03-06 13:38:54 +0100)
> 
> ----------------------------------------------------------------
> Renesas DT binding updates for v7.1
> 
>   - Document RZ/G3L SoC variants, the RZ/G3L SYSC block, and RZ/G3L
>     SMARC SoM and Carrier-II EVK boards.
> 
> ----------------------------------------------------------------
> Biju Das (2):
>       dt-bindings: soc: renesas: Document RZ/G3L SoC variants, SMARC SoM and Carrier-II EVK

This is DTS branch patch.

>       dt-bindings: soc: renesas: renesas,rzg2l-sysc: Document RZ/G3L SoC

This is drivers. Splitting it into additional branch is not making it
easier. I don't know where is this supposed to be merged. I will take it
to drivers, but in the future, please do not put DTS bindings into
driver bindings.

See also submitting patches in DT dir.

Best regards,
Krzysztof


