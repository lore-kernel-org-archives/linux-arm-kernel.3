Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B86BF8D770
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 19:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TmytUfmzuxhfxOeP1eqiJ5faxsDgBOpvZsoqAbGEPTk=; b=3chkMTbkE9laV+GAt6qmUZ8+oY
	QiltruqteNu0AJvWyj50VqKDQKlBUo3hjxZ9o3ECaZKJWIf5zWzf0qor0haEtMxtF9lBPZuAJbP0e
	fFtFVawcgywgKyTx2Igd2hkg0kcXMMu4I8Q8q6bfKSppNFp+HXt/M7kawbBgTsK1Ld7iVChDCSo+P
	krPKTD/+IASuy23ffWI4Ny+OihGFfeEZvDPZqKLXtYxfd/fTxu1GdkkHgM8JCpxCdmYntg4Z5vab0
	UsJLacuvZHPmBixM+Pm0TwqWXAJxfc4bszD7dluHANxVXd/A8BG8yZTDyBLvfyQTzqfZyDzrK2uwx
	pXL4tqnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDSHJ-00000002ri7-36Hd;
	Thu, 16 Apr 2026 19:21:29 +0000
Received: from mail.toke.dk ([2a0c:4d80:42:2001::664])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDSHG-00000002rhK-2u06;
	Thu, 16 Apr 2026 19:21:28 +0000
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Authentication-Results: mail.toke.dk; dkim=none
To: Rosen Penev <rosenp@gmail.com>, linux-wireless@vger.kernel.org
Cc: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Manivannan
 Sadhasivam
 <mani@kernel.org>, "moderated list:ARM/ACTIONS SEMI ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/ACTIONS SEMI
 ARCHITECTURE" <linux-actions@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH ath-next] wifi: ath9k: owl: move name into owl_nvmem_probe
In-Reply-To: <20260223224254.27081-1-rosenp@gmail.com>
References: <20260223224254.27081-1-rosenp@gmail.com>
Date: Thu, 16 Apr 2026 21:21:16 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87fr4ubtjn.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_122126_899793_A32767B2 
X-CRM114-Status: UNSURE (   4.37  )
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

Rosen Penev <rosenp@gmail.com> writes:

> There is no need for dynamic allocation for a simple string.
> request_firmware_nowait copies the string internally anyway.
>
> The error message on failure is also wrong. It's an allocation failure,
> not a find failure.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Acked-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk>

