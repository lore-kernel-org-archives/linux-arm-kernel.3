Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C48C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 16:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mHkxjlqdOEuPJm1mWSo9L0o83CjB6tvlKtNIrEvVJ0w=; b=ib/2LAvxVC0Ah6duejA36yQnzo
	MgTyrUISvu3kCV1mO+1uAOvccTamyk0BufrcQ3VjSSS8zeLAmNMHcbTupymrEWs4ocbI/52QYQ8Gv
	lSnI9yJSvfCucMn7K0cIU7TG1AL6pdgz2ADPte0OSdLeG7RdbRsO5HlupuxJbY9nUit/p/rdNK1lo
	Ko44vPdi+pgDVENLyxzjXqL2dFPyPAnEY6Z6m31Km1WbOMkO90jb5mlBWzsxlnCOT1erug4YCjsD+
	HZE1Cn5Ip18gq92mSxIZ+yQ4403xn9qROfH+I5jHsFJVy18sOG2/n6ugbqu9JWvqrKl2ud+UWkF1r
	kkDK4A4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvIuV-0000000Chwf-00LY;
	Thu, 20 Mar 2025 16:38:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvIsm-0000000Chkk-18lo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 16:36:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AECE55C6C6F;
	Thu, 20 Mar 2025 16:34:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58AB2C4CEDD;
	Thu, 20 Mar 2025 16:36:34 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: mm: Don't use %pK through printk
Date: Thu, 20 Mar 2025 16:36:31 +0000
Message-Id: <174248858719.1537208.2049891754496228944.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250217-restricted-pointers-arm64-v1-1-14bb1f516b01@linutronix.de>
References: <20250217-restricted-pointers-arm64-v1-1-14bb1f516b01@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_093636_364912_CB5711BD 
X-CRM114-Status: UNSURE (   7.51  )
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

On Mon, 17 Feb 2025 08:39:06 +0100, Thomas Weißschuh wrote:
> Restricted pointers ("%pK") are not meant to be used through printk().
> It can unintentionally expose security sensitive, raw pointer values.
> 
> Use regular pointer formatting instead.
> 
> 

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: mm: Don't use %pK through printk
      https://git.kernel.org/arm64/c/892d20acf36c

-- 
Catalin


