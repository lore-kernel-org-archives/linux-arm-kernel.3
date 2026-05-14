Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA02CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 07:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p98KzwxjtK+qXsU6qLh3yNUQy78SrJ/P4qapIBQhRBE=; b=rJH8IoqTu5WM5h
	E4GuiPvHV9lrB8432Mm0cOPEcUJuZBPeHR3bRvJ++BSGrNoKLCA5lr5CD9tpena+IR5p28lrPB5KY
	wAr/R8kgSyJWlBrX1aKfqkWXl33zHiif5lxxn7iaHujP5tqHmPl4Y3d62cFLVeibjH7TIATWT3atg
	9bd5MSzpQsAck6i+u50mJEGhqeFtu14uKMM3idJWvPqwwpAyPCZTUCWUFOrOf6G0+s6VWx8WCApSx
	px9aWebKRyNxKi25IDhx8svg7KAQMps6OfFaR9rC/nwio9MLNLelFejNkb+1mNBxCRfF7n/NCTk8i
	0GJWYDCJqmAI32u0cWhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNQ5U-00000004mWx-2kDP;
	Thu, 14 May 2026 07:02:28 +0000
Received: from mail.puresolution.de ([212.204.113.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNQ5S-00000004mUW-0F9S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 07:02:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puresolution.de;
	s=neog00; t=1778737852;
	bh=p98KzwxjtK+qXsU6qLh3yNUQy78SrJ/P4qapIBQhRBE=;
	h=Reply-To:From:To:Subject:Date:From;
	b=abhANs/6geRYH8zYoyQ2XLMTyvU26guy2rr58rHC9D7mNvDtiTY86Ia1zRg9/FMcx
	 wYw34LkTX1xEQg7xby+BZJsyutXsfp+cR2pWEm4XRvVT8rR5UAriD44YzUDYn9O8BH
	 sv1FrGE4BNK/kkuWuuxJKK2m9tEHJWQoUvFOJoel89t293/vPBavCkEsVZLGfSk6EB
	 nv+dvhsSrAoapt4/qtz25znW99z+iNeTgGdExYarHNcEMvrZArBbnjr5klHfBdrSIQ
	 npt6tDcSzkJDVGA7lt7SqLuJk8FQII2IBZphMZF57qXSwO99mUy0Yx5fxcEzr8v7p4
	 a9HRwsrbAz6LQ==
Received: from customer.lgosnga1.isp.starlink.com (unknown [98.97.79.78])
	by mail.puresolution.de (Postfix) with ESMTPSA id 4D9CAB93DF
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 07:50:52 +0200 (CEST)
From: "Euro Millions" <tomcat@puresolution.de>
To: linux-arm-kernel@lists.infradead.org
Subject: =?UTF-8?B?SGVyemxpY2hlbiBHbMO8Y2t3dW5zY2g=?=
Date: 14 May 2026 06:50:51 +0100
Message-ID: <20260514065051.7A4C2A467E48E7E4@puresolution.de>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_000226_246864_55FBC51C 
X-CRM114-Status: UNSURE (   2.27  )
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
Reply-To: emailnet@mail2webmaster.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Herzlichen Gl=C3=BCckwunsch, Sie haben =E2=82=AC650.000,00 bei den monatlic=
hen=20
Gewinnspielen von Euro Millions/Google Promo am 1.Mai 2026=20
gewonnen.

Bitte geben Sie die folgenden Informationen ein, damit Ihr=20
Gewinnbetrag an Sie =C3=BCberwiesen werden kann.

Vollst=C3=A4ndiger Name:
Heimatadresse:
Geschlecht:
Alter:
Telefon:

John Andrew
Online-Koordinator

