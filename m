Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C033F606A9E9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 13:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W7UJDYXC;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=gVkKcdyw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qEC5D0LF9e/JOlM8sgTaH4qiRnn1eg0HLkg9p1QEwmU=; b=W7UJDYXCUaeVk4NZFnsnGShs/E
	XTT25IPvXUbXj4ehqIxX7J3p1ha31i2XdMCta8NlcUXzIG4N47QnTocqs38AlGXp9rFGpVjcaL0T4
	vNKVjZ8vJQqfe7ye6DITbbAg2lW5mLRtgN2Siva8nblHEPrIsZo6Rtfix/n8ry0GL8PUtNqsoHnt0
	9vJN1AtjpOWQ5DrJxzl923HbgHF1kqs6F50H56JFqLUnkLgAPpdv+UeigIp6DnkhxpVo4jXByTi5s
	Mjs01OnTnk5JdFsUl3/kAW911BsGS5OHnrwaqBDlriFTg8hwj0vsD2lmuTrte1AfjzyWL0RpnvtY2
	HJPDW86A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhGv-00000004sYX-2jrz;
	Tue, 27 Oct 2026 13:31:25 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhGs-00000004sXe-3MOS;
	Tue, 27 Oct 2026 13:31:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=qEC5D0LF9e/JOlM8sgTaH4qiRnn1eg0HLkg9p1QEwmU=; b=gVkKcdyw0U2MQvyLMmviOIuJ9j
	xya+zVI6IoIafmhBMUgl3dv4Jf1WA7cvIQj8ZbG7YDrZg6ObXmrdpXzez7DY0WEFxINKoU242J6an
	NJ3lmLxmcS3dB6WiX4VVy+Aedi+TLCI4QwA/yrzCKHVjXRWdk28irHuSW02PyuyBQOjJ5AXEWWXu9
	iwLNJOxU0UXmS9i6SjAtd1mv4hE1GXzWroz4zXbX90ZMt8uSBsZsLhRGrddCZ0ZQrWgOiPXWT+GA3
	D0YcsjhS3nfIlDM0pAO6yUKa3+R89BKkK7cdAcK1OfDt7Jq2GO5YyunjzF4nFoj4KSY7BLR3eFVJR
	hDp2S9Kg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: 1579567540@qq.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Elaine Zhang <zhangqing@rock-chips.com>, Ulf Hansson <ulfh@kernel.org>,
 Finley Xiao <finley.xiao@rock-chips.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 2/2] pmdomain: rockchip: Add RK3572 boot peripheral domains
Date: Tue, 27 Oct 2026 14:31:10 +0100
Message-ID: <1942535.QCnGb9OGeP@diego>
In-Reply-To: <080cffd7-05e6-458d-a00a-b757b0f44aa5@rock-chips.com>
References: <20261026-add-board-ok3572-c-pmdomain-v3-0-70d614d3d921@qq.com>
 <3329883.fEcJ0Lxnt5@phil>
 <080cffd7-05e6-458d-a00a-b757b0f44aa5@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_063122_898540_98A89D2E 
X-CRM114-Status: GOOD (  18.26  )
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Dienstag, 27. Oktober 2026, 02:10:37 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Finley Xiao:
>=20
> =E5=9C=A8 2026/10/26 19:53, Heiko Stuebner =E5=86=99=E9=81=93:
> > Hi Finley,
> >
> > Am Montag, 26. Oktober 2026, 12:37:06 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Finley Xiao:
> >> =E5=9C=A8 2026/10/26 16:47, Finley Xiao =E5=86=99=E9=81=93:
> >>> =E5=9C=A8 2026/10/26 11:21, Cunhao Lu via B4 Relay =E5=86=99=E9=81=93:
> >>>> From: Finley Xiao <finley.xiao@rock-chips.com>
> >>>>
> >>>> Add support for the RK3572 NVM0, NVM1, PHP, and VOP power domains.
> >>>>
> >>>> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> >> I have to point out that the changes (the shutdown/restore
> >> rework, pending-state tracking, etc.) were not made by me, and I have
> >> not reviewed them in detail. Therefore, I should not remain as the
> >> author (From:) of this patch, nor should my Signed-off-by be kept on
> >> it.
> > As this seemingly comes from the vendor-tree, _some_ Rockchip authorship
> > should be kept I think?
> >
> > Do you have a suggestion who that should be other than you? :-)
> We have never carried code like this, and the other parts also
> differ significantly from the Rockchip kernel. It does not appear
> to be our original code.

thanks for the clarification. In that case it should _not_ claim a
rockchip authorship obviously.

Heiko



