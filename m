Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC3F1112244
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 23:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+VHuWoyhBweRx7yw2tg1L4IJW6lugGb4ajCOqBvp3W4=; b=tiE5oHZXAHy0uHExOMD5dNgQcv
	AA2EBnHuGJcduwdHk99NgGNeIRFg74HwTeG7rqiOq9uupSU85es1AQry28A8qXizp/TWs0zmkCM+j
	NBu3WKW82PzNmnvpXRKj3H3TKydXWV4EzIHdy9Qdwhj6SrjJW093Zyqz9+0gp6n97DNs/mVSQt6Hb
	J44E+JuTwfLFQRoxKeSkWv2TfoxaTtv8ZjRoZc07sHlj+Kn8hHJ8i9hlExwFe5gqd0EEElpQrOk24
	NTs+5PhxGk1vDJLjUtuzAbMdmGkk4Lx7pKbKpXXTRQaoK5zfHr+1nAnAzD5o1d/4bG482P3BT8lta
	HQKxYRuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Ys-0000000GNd4-0K0b;
	Wed, 01 Apr 2026 23:01:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Yn-0000000GNVy-34hq;
	Wed, 01 Apr 2026 23:01:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EA0CB61339;
	Wed,  1 Apr 2026 23:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7DF2C116C6;
	Wed,  1 Apr 2026 23:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084476;
	bh=/ydyEhz1DfGzumvhdQVG/OS2phIoiIQNTGMzn2SAkqw=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=Di5bTnxLkcJhbLRMmhbxvJjKY0SRkVEVWg/GdP1ZUtuebRBulfhXtGIssYtVqr0/J
	 XbYaoQPxt0nen0sXPYp6ql95eED9JB4UKDLcuAXM4toIW+wh/+IgRiDJJ2W0TPTZbx
	 ZRrpoSyzBeVowO7594KsTK3dsPW9L7y36OhRGkOGrPPSxz5OFvKixna8yH6WzDnG2i
	 Fbc2psWZS3oc0Bw7XSvdfVARkvJTB+5A/UqVJyY2TVw9JZDFmfvxqWDatbrKCt/dfB
	 hmVkwcWfF3TI9yCwWruUNtRztqpjPXoknhPCnxmtMeqlZ1s9NBB7OPRWEFjbAO4w7a
	 BrkP/vME8nT6w==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 23/33] docs: rust: quick-start: update Ubuntu versioned
 packages
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot <acourbot@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, 
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
 linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
In-Reply-To: <20260401114540.30108-24-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-24-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434465.73816.4492182082440539007.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=585; i=tamird@kernel.org;
 h=from:subject:message-id; bh=/ydyEhz1DfGzumvhdQVG/OS2phIoiIQNTGMzn2SAkqw=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnF7s4Hs3X/Mwf1e/3yfei5X/Nlv0LJig4fzB9vHvai
 hk+7LstOyayMIhxMViKKbIkih7am556e49s5rvjMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOgY4xAxenAEz139mMDFcPbV78tEDfR/rr1/KU/WF3PJ6fadDkEzkx9cmvaIFAiasMf7jrLgo
 8C2izvvSmccbjZ+5aTn9Vk0XX1rsL7Xle8aHNlx0A
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
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

On Wed, 01 Apr 2026 13:45:30 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> Now that the minimum supported Rust version is bumped, bump the versioned
> Rust packages [1][2][3][4] to that version for Ubuntu in the Quick
> Start guide.
> 
> In addition, add "may" to the `RUST_LIB_SRC` line since it does not look
> like it is needed from a quick test in a Ubuntu 24.04 LTS container.

RUST_LIB_SRC is also mentioned in the nix section, do you know if it is
still needed there?

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

