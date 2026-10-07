Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D3CCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 14:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFHWy0Xgz31BempumzZXo1smkzslk7H7S6NadQM7fMk=; b=iD9ZrNua3rMpL7hkaQzhd+CPNy
	LqtU1NTrN43R38j7AtKYAoMctofPDIWKtV3H4QZurmOgUpkL1i3F8jq59FIUKwoiQx/QYYGLpcsKs
	v3Z194Vn9I63FMpgoAF9WxaOpi1Die4K7+JejpxECvMKvXa6cIaMJOP6Ig/XBuhsRE89N4Jz/Mayq
	NF9kjM9lcB/HJ2ybjdZpLATGvTTGpiwC0wo6BSKq1do1Hp4zlXoig2GD1boJ4GMHfEVAJ+Zils61u
	4YtIkfs9gwEoh/kIb1N3/TXWmier5B/4wc9uHAfZe8M5jZJ6vONPiiWuwnK9AaFe//xazBws0Hz0B
	DNT4LqDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEStY-00000002dvk-3x3w;
	Wed, 07 Oct 2026 14:45:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEStW-00000002dvT-1n1g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 14:45:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A31D860202;
	Wed,  7 Oct 2026 14:45:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D53C1F00898;
	Wed,  7 Oct 2026 14:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791384321;
	bh=OFHWy0Xgz31BempumzZXo1smkzslk7H7S6NadQM7fMk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DKTOx/FkMlY45v+uipdMcRrUJRiiMiBhF+UJqoxmxrL5/1zVKTT9cASGcqS4Ox6sY
	 Kw0EsxKruDUbTSELWF2UFSkyd6MDKsXFznAEIrpyrXmzQbhNGBA6pM/2/+IsoJ456S
	 WIsJ0qhF1OOtzHbycsdz0hHPbiCYkQeLrmcNxXG7Mln2aYYBxL039iFUPNBlXujJ2I
	 hxT+KJO+l9ZRZ9mS0Rr2AyOEpIQmLImsIOPpI414tLNlyG9AJEMmNLeS5Ls5/Q/U6K
	 CqtJ/hokvw40ij1SZ5xGhNV0t0MqRqlWstDS4S6L1BzQ4MlQ+WlcEwZUXUJzieTfcE
	 CFvmHKSOoiliA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Update ARM_SCMI_HAVE_TRANSPORT rationale
Date: Wed,  7 Oct 2026 15:45:15 +0100
Message-ID: <179138427395.614377.18097611083155706293.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <48c4bed8036dcb55f554f513ce2ae61807c5677d.1790684637.git.geert+renesas@glider.be>
References: <48c4bed8036dcb55f554f513ce2ae61807c5677d.1790684637.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 29 Sep 2026 14:25:56 +0200, Geert Uytterhoeven wrote:
> Not enabling any transports no longer breaks the build.

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/1] firmware: arm_scmi: Update ARM_SCMI_HAVE_TRANSPORT rationale
      https://git.kernel.org/sudeep.holla/c/e637b7744167
-- 
Regards,
Sudeep


