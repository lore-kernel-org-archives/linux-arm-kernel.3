Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E19D35173
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 15:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kcoc0BN5ofl1kwegqdCcrmzG2n5wieyFU0iEqLqJvg4=; b=aRtm5WO2V9QRbBjZjHs7trU0Hl
	SP7QAJ198RV5o6hfixkGCVSNwal+OP7IukFVeRlHp+ZFOhlDt7iVNukAq52MiLqI3+TSTgEDBLgxg
	ojn4YQ61yClDV/EEjW0/ZhWdzuI3vOieNI91Ff06Hmn39vfUYs8mcr2f2tPfbx7kzai6Aj7L+BRh8
	qW8Nvlkwl7b4e9Eov7p8RR/3XnOD191+yNqZmHCtex4/IEkL6bqy2QeleqdPC/XkwsqgJ8dBZQVKk
	A0Ij4PKvKa/PCNc7mVq8P5fzJ37/J9AvwbDod5BbdCkn8Ji86yX6WO295N0amdF8KNIV+hw+npuXl
	R/fe5Txg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7xfm-0000000Fedv-3qXo;
	Wed, 01 Apr 2026 15:40:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7xfl-0000000FedM-0sbC;
	Wed, 01 Apr 2026 15:40:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B6D3840D5B;
	Wed,  1 Apr 2026 15:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2904BC4CEF7;
	Wed,  1 Apr 2026 15:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775058000;
	bh=qluaTkvREC5+yG58ljxsV6cqHwaNZiO+EKP753RRYcg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XtWc7kSBpczDhOeDzctojUGhjkDX9yLOncrss4xMBiCV/aNAFElErs7mbZxhOzBFj
	 IjIntWeGJXpFhKhS/f3AB+fYVKP1SKYagi5+a2LPJgthzcivJeg5Rz9GV4Rw4eFXw7
	 fIPUmcXhywGnFMLSWkC3nbdoxcr1E/+qjOIUMtmLmnJBEAZi4KMImfvb1v0eym+x2e
	 9qqygeFi0bxup5RxJ5c78WULUV35EpKtPMYapo3WLjNS865aTrEt2qKUl6WScPk4JE
	 NEJW+MxF0alErQ/CFCZjckq9jlMzUYvZTb0k9w4o2IO9WAfLDuQWKDcTRbseeV3Jom
	 THPMVL/ytMNMQ==
Message-ID: <51bffefb-395f-4ece-90ba-588b2bdadaac@kernel.org>
Date: Wed, 1 Apr 2026 17:39:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/33] rust: bump Clippy's MSRV and clean
 `incompatible_msrv` allows
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot <acourbot@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>,
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org,
 moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-3-ojeda@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260401114540.30108-3-ojeda@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_084001_274753_719D0C8C 
X-CRM114-Status: UNSURE (   4.89  )
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

On 4/1/26 1:45 PM, Miguel Ojeda wrote:
>  drivers/gpu/nova-core/gsp/cmdq.rs | 6 +-----

Acked-by: Danilo Krummrich <dakr@kernel.org>

