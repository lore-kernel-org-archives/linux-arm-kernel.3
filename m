Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3AF606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 16:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d+vTtDFO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uxSAUdDO3MwPK+26JuHSTsq458DkeZfKh4h7kUJVnPI=; b=d+vTtDFO/7ueZ4WobSWgx0bV9n
	BXy+bEhbaCAWje6/oYiTbq9efNQ8BwEW5/iYU0n4ttIx4zxVoydjzLIkCj4WHG/hWurq0FvhQ6+WM
	ZeOwp3MFuIozyPbBkjK8w9Ed62JiXXrowwnTCxgQ2sbJHnBWsuQlznL5fWBq8gjEFBJOZUEQdHvco
	qe9CSswFac76gbC5mGsVLNdef652CS0P9AEQWiybdJvQf85LCX5TqyGUNuh3QcVfXPI08jDvSQPCi
	s+SvMuBWRDpkpOFwFKEPn/p5iYSrPcFhfaHcVERogGUiwTDptBMc9RU7rdXfkUZIHDOmKW3XuJtOj
	8U72fnuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6Fe-00000007Vvk-1qPT;
	Wed, 28 Oct 2026 16:11:46 +0000
Received: from smtprelay0017.hostedemail.com ([216.40.44.17] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6Fb-00000007Vug-2vpl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 16:11:45 +0000
Received: from omf08.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id D9BA980162;
	Wed, 28 Oct 2026 16:11:36 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf08.hostedemail.com (Postfix) with ESMTPA id A762B20029;
	Wed, 28 Oct 2026 16:11:26 +0000 (UTC)
Message-ID: <aacb76ee8a23f956eb2e778da7b125d86d164b25.camel@perches.com>
Subject: Re: [PATCH 10/10] checkpatch: suggest nonnull attribute conversion
From: Joe Perches <joe@perches.com>
To: Dmitry Ilvokhin <d@ilvokhin.com>, Alex Deucher
 <alexander.deucher@amd.com>,  Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
	 <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen	 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>, Lee Jones
 <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Joel Stanley	
 <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen	
 <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, Kees Cook
 <kees@kernel.org>, Andy Shevchenko	 <andy@kernel.org>, Matthew Wilcox
 <willy@infradead.org>, Andrew Morton	 <akpm@linux-foundation.org>, Andy
 Whitcroft <apw@canonical.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap	 <rdunlap@infradead.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-hardening@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org,  Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 28 Oct 2026 09:11:25 -0700
In-Reply-To: <bc2cd702455e58feb777cdb230e3ba4f7e1db60f.1793027261.git.d@ilvokhin.com>
References: <cover.1793027261.git.d@ilvokhin.com>
	 <bc2cd702455e58feb777cdb230e3ba4f7e1db60f.1793027261.git.d@ilvokhin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: A762B20029
X-Stat-Signature: 5m56y4bjcqjn15doddn3439d63u3xrtz
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18kHAE4RjXJ/BeJ9lSamcdiJOrG4xRY5jU=
X-HE-Tag: 1793203886-334294
X-HE-Meta: U2FsdGVkX1+vO3ZouaggYmakzKiEViVwEjIkayqsOUxRh4Y+D03W9OsYvhntgdSUdjdTBgNAGM07O+W/OBkN7qiawu9kPLoFiAUred/Z/Bvw2Ynv8IG7qnAPxQ8uaps63yUCxrPyn7HCEVo07x5i6NYNvKDhGCJh54qqNDafUAiSXShW2FGTVwwUUFc93x1OQO9f/LKoTfr2/KbcvJm3wJYFIWxls5MSV6vUbxfQ1CWIN5fZL2IoMApFvaTjDQjqQiBboJBwZoq4pSCGSqpTDJvfdjT4vabv8HAYbaFYZefsnth8dvgSgzQtAJujUJ5T/R386onDul4BmhyfIQ2SbKwU1ePW8+59QlMTPdteTFyX32nsSOnI504//g+rZB3j
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_091143_802245_E1DDC199 
X-CRM114-Status: GOOD (  11.24  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 2026-10-28 at 08:19 +0000, Dmitry Ilvokhin wrote:
> The kernel provides the __nonnull_args() macro as the preferred form for
> marking pointer arguments as non-NULL. Add a check suggesting the macro
> over the raw __attribute__((nonnull)) spelling, consistent with the
> existing attribute conversion suggestions.
>=20
> Examples:
>=20
>   WARNING: Prefer __nonnull_args(1, 2) over __attribute__((nonnull(1, 2))=
)
>   #11: FILE: drivers/soc/aspeed/aspeed-lpc-snoop.c:230:
>   +__attribute__((nonnull(1, 2)))
>=20
>   WARNING: Prefer __nonnull_args() over __attribute__((nonnull))
>   #11: FILE: drivers/soc/aspeed/aspeed-lpc-snoop.c:283:
>   +__attribute__((nonnull))
>=20
> Signed-off-by: Dmitry Ilvokhin <[d@ilvokhin.com](mailto:d@ilvokhin.com)>

Seems sensible, thanks.

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -6856,6 +6856,7 @@ sub process {
>  				"no_caller_saved_registers"	=3D> "__no_caller_saved_registers",
>  				"noclone"			=3D> "__noclone",
>  				"noinline"			=3D> "noinline",
> +				"nonnull"			=3D> "__nonnull_args",
>  				"nonstring"			=3D> "__nonstring",
>  				"noreturn"			=3D> "__noreturn",
>  				"packed"			=3D> "__packed",
> @@ -6876,6 +6877,8 @@ sub process {
>  					if ($curr_attr eq "format" && $params) {
>  						$params =3D~ /^\s*\(\s*(\w+)\s*,\s*(.*)/;
>  						$new =3D "__$1\($2";
> +					} elsif ($curr_attr eq "nonnull" && $params eq "") {
> +						$new =3D "$new()";
>  					} else {
>  						$new =3D "$new$params";
>  					}
>=20

