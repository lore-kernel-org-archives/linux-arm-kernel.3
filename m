Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BD6606A328
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 14:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KWcrMCPl;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JIpwWVJD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gmZMoog7Knh/OMnJRYd6yhL9S4j+bQeuh5tH/D8XkYs=; b=KWcrMCPlAR0me5
	fNYNbU8L7ednOOX0x4OP6bRBSRH/KDztMeFqiv9+alN9m+xOvRDLT1c0RBUJvs7oveTJQnrHkzlDu
	TbSt1a9UMUEEJ01Xyzd5VvronQcG6bdyulTGgmYuCNgmeitCkE22D022UN8T22yrwmP2lj8aby7By
	bLkVWml0hDx7oY/5jCstdnr246agTFAantWSgXisXsJsGbKt1cugKpogorNHgz3Bqv1iEDcDh9Bji
	Vpqt/TefP4tKB7e59gvqTiUi7l1TjshfTwRtZ+Fsirso+hWj2SPP5se0H86Zhdc0J2/y+5qUOAPHX
	T4XXF26rLIkDXDLrLgbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcEE-00000005g5c-2ndp;
	Wed, 04 Nov 2026 14:44:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcEE-00000005g5W-198p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 14:44:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E927043BB0
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 14:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB28F1F00A21
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 14:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793803481;
	bh=gmZMoog7Knh/OMnJRYd6yhL9S4j+bQeuh5tH/D8XkYs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JIpwWVJDSZthuxauytHZVpUBhT35lDXWU7JnrJh15d+/c76AHM0G2XtbpGRK6yUwf
	 VQF2Ifo55xwfPF4A+jja/aQAfhdSlde//PwWH5cD4HLluPLXbGipFmpwf5K2MD1/rS
	 WCarMKbC+QGEzjT/HvfGYm5il6FIpFWzOIJAXbyT7DWvlPwP7sp4IDwVfaP7iJamHJ
	 JSB4ysBFQt3OOH/W9AAYLVcbE7i1edPrUT/j5+XyWCZbRr6ELD2oLY9czFMgHOt2yn
	 9jriZr7SV03MOvWpif0KUNFbD9vFvXzXBrB2K3XtT4X4qLY9H9Dbck14UfQ1ZczE+8
	 bBd2U/LyYauJQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be42ae8eadso517339e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 06:44:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBz4/IAY0DXOXRTADn+BDhzqhlQRcylT4zUTN25Z9CDca26PsOWZuoXCvS3twqTPVRs0JcFzUmJawfQZWsxau36o@lists.infradead.org
X-Gm-Message-State: APuU4Z84OMKJn2bVRijpd6GfAxECftgrVcvQaW17IbjwS/h73DUEqgWh
	RAxiccqiHuPcqKQmOc7VEWTA9TRPuxsdg2TPCFPa+jBdPemX7tF6CGWWxtV3xqTAuCWSvWJ9YsI
	65KAU5K+bLCX7iKoeo+xkA3m2OYL6OPg=
X-Received: by 2002:a05:6512:3e03:b0:5ba:41f0:5a45 with SMTP id
 2adb3069b0e04-5bfd9561f19mr5431515e87.21.1793803480211; Wed, 04 Nov 2026
 06:44:40 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103221717.3840215-1-briannorris@chromium.org> <20261103141442.v2.1.If69ddc515c2e9fd4338441e87688b9d690d2ef36@changeid>
In-Reply-To: <20261103141442.v2.1.If69ddc515c2e9fd4338441e87688b9d690d2ef36@changeid>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 4 Nov 2026 15:44:27 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jb+=Wzp+awZmtk-PXB+oS+NQk+VXKCtXCFo8ELLUc9yQ@mail.gmail.com>
X-Gm-Features: AclHuK9gTEmcX27Bq07hep_nJ7cMaPt2IP1nezlEMxrLMz_VLm2hu4KjJWZY_Xo
Message-ID: <CAJZ5v0jb+=Wzp+awZmtk-PXB+oS+NQk+VXKCtXCFo8ELLUc9yQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] PM: runtime: Only queue an idle check for
 RPM-linked suppliers (part 2)
To: Brian Norris <briannorris@chromium.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Fabrice Gasnier <fabrice.gasnier@st.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Ulf Hansson <ulfh@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	Andy Shevchenko <andy@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 3, 2026 at 11:23=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> Commit be5755f023e7 ("PM: runtime: Only queue an idle check for
> RPM-linked suppliers") was incomplete. There are two other cases where
> we perform idle checks on non-DL_FLAG_PM_RUNTIME suppliers -- in
> pm_runtime_set_suspended(), and in cases where we failed to resume
> suppliers.
>
> Fixes: 5244f5e2d801 ("PM: runtime: Defer suspending suppliers")
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
> Noticed while touching this function in subsequent work.
>
> (no changes since v1)
>
>  drivers/base/power/runtime.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> index 304a2b123420..9d3508d9b4a2 100644
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -343,6 +343,9 @@ static void __rpm_put_suppliers(struct device *dev, b=
ool try_to_suspend)
>
>         list_for_each_entry_rcu(link, &dev->links.suppliers, c_node,
>                                 device_links_read_lock_held()) {
> +               if (!device_link_test(link, DL_FLAG_PM_RUNTIME))
> +                       continue;
> +
>                 pm_runtime_release_supplier(link);
>                 if (try_to_suspend)
>                         pm_request_idle(link->supplier);
> --

Applied as 7.4-rc material, thanks!

