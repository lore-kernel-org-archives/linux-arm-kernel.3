Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E65C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 09:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fnJN7saYpK6umAv4VngGZWP2Enb/6tVAyWtGhECPeb4=; b=yQaPTtwHVeTcpJaOf3igmzGatJ
	u6m4lbibO/3KoFOgh38+h+RecvmBvmfpenoh94SyFmz2WhaecV+YxE7Z8pm9KOHoheganF2q6GxDC
	AuznrlO3HFFX5tfHlY0sJVXQkH5bQtJDqOv7AxNrTVARp3wZdth+jAYEhJAdXgT6UumiKdDH4jyK4
	vLoP/rvFMSZkNPhdpITBkCXwRbhFOBOFqH7d4uig5MWM8NmrHq0aYaS9RtXiyqoir6Njppu6+ldka
	PNtHWFG/bsLaJAZbBEuZDq/+bBBKRiBi3j+Cq1REIU0netvZG1aRGfQxBYPgz27rNPmglkcfa168g
	OJ6hCo3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhPdC-00000003HKy-3XPV;
	Thu, 31 Jul 2025 09:31:22 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhPJ7-00000003FJs-0Ljr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 09:10:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=fnJN
	7saYpK6umAv4VngGZWP2Enb/6tVAyWtGhECPeb4=; b=YkYhnZfbpd/6YPVvYBxE
	c1cZzeLS+1RbNZj2/YOyF6PLRFQESop7rXXCexSHNmy6Uq/37PjUHgaH6M3W3Ou5
	2Cl7xdmgLAqPcdOfR2YE+b6kEW8xJGrXtKueGi9v0xTTOlttBz2rbOSUMQPXOp8c
	VvlRmFpWsDFMSg3jmC1o4+J24Ejm5chrOob7n6GZEzXsFNYTKBRwZ3kHsCsal69t
	5PiQKOjX9j0rrHSZNeZBE7fRyY0N5/BjSVoi91q6O0JJxjtT088GGJY+L8Vi64hj
	gGoTI70BVdtodTaOBxQBAMJ8JfCuH0cZQSH2grZVcyj5SKVlriLvmUSYxSCz60B0
	AQ==
Received: (qmail 276493 invoked from network); 31 Jul 2025 11:10:35 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Jul 2025 11:10:35 +0200
X-UD-Smtp-Session: l3s3148p1@I2aaAzY7lMsujnsl
Date: Thu, 31 Jul 2025 11:10:34 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: shmobile: rcar-gen2: Use SZ_256K definition
Message-ID: <aIszCq_d-thU2o-8@ninjato>
References: <c54097a263eb3e451e5e223609a3630d4409dcdd.1753951039.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c54097a263eb3e451e5e223609a3630d4409dcdd.1753951039.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_021037_391758_BEF67497 
X-CRM114-Status: UNSURE (   6.81  )
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

On Thu, Jul 31, 2025 at 10:37:45AM +0200, Geert Uytterhoeven wrote:
> Use SZ_256K instead of calculating the same value.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


